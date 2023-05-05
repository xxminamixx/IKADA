//
//  StageAction.swift
//  SEKITOBA
//
//  Created by 南京兵 on 2023/05/04.
//

enum StageAction: Equatable {
  case getStage
  case response(Result<StageData, Error>)
  
  static func == (lhs: StageAction, rhs: StageAction) -> Bool {
    switch (lhs, rhs) {
    case (.getStage, .getStage), (.response, .response):
      return true
    default:
      return false
    }
  }
}
