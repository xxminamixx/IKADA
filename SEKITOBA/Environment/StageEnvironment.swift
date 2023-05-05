//
//  StageEnvironment.swift
//  SEKITOBA
//
//  Created by 南京兵 on 2023/05/04.
//

import ComposableArchitecture
import Foundation

struct StageEnvironment {
  let gateway = StageGateway()
  let mainQueue: AnySchedulerOf<DispatchQueue> = .main
  let matchType: MatchType
  let timeZone: StageTimeZone
  
  init(matchType: MatchType, timeZone: StageTimeZone) {
    self.matchType = matchType
    self.timeZone = timeZone
  }
}
