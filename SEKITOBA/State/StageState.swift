//
//  StageState.swift
//  SEKITOBA
//
//  Created by 南京兵 on 2023/05/04.
//

struct StageState: Equatable {
  var results: [StageData.Result] = []
  var matchType: MatchType = .bankaraChallenge
  
  static func == (lhs: StageState, rhs: StageState) -> Bool {
    lhs.results.first?.startTime == rhs.results.first?.startTime
  }
}
