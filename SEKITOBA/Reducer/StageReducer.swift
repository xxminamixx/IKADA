//
//  StageReducer.swift
//  SEKITOBA
//
//  Created by 南京兵 on 2023/05/04.
//

import Combine
import ComposableArchitecture
import Foundation

struct StageReducer {
  static func reducer() -> AnyReducer<StageState, StageAction, StageEnvironment> {
    AnyReducer<StageState, StageAction, StageEnvironment> { state, action, environment in
      switch action {
      case .getStage:
        struct RequestStageId: Hashable {}
        
        return getStage(environment: environment)
          .receive(on: environment.mainQueue)
          .catchToEffect(StageAction.response)
          .cancellable(id: RequestStageId(), cancelInFlight: true)
      case let .response(.success(stage)):
        state.results = stage.results
        state.matchType = environment.matchType
        
        // チャレンジの通知だけ登録する
        if environment.matchType == .bankaraChallenge {
          notificationRequest(results: stage.results)
        }
        
        return .none
      case .response(.failure):
        return .none
      }
    }
  }
  
  private static func notificationRequest(results: [StageData.Result]) {
    results.forEach { (result: StageData.Result) in
      guard let hour = result.startTime?.components.hour,
            let ruleName = result.rule?.name,
            let stageNames = result.stages?.map({ $0.name }).joined(separator: ", ")
      else {
        return
      }
      
      LocalPushNotification.shared.notificationRequest(
        title: ruleName,
        body: "現在のステージは \(stageNames)",
        hour: hour
      )
    }
  }
  
  private static func getStage(environment: StageEnvironment) -> EffectPublisher<StageData, Error> {
    Future<StageData, Error> { promise in
      Task {
        let response = await environment.gateway.getStage(matchType: environment.matchType, timezone: environment.timeZone)
        switch response {
        case .success(let stages):
          promise(.success(stages))
        case .failure(let error):
          promise(.failure(error))
        }
      }
    }.eraseToEffect()
  }
}
