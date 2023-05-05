//
//  StateData.swift
//  SEKITOBA
//
//  Created by 南京兵 on 2023/05/04.
//

import Foundation

// MARK: - StateData

struct StageData: Codable {
  let results: [StageData.Result]
}

extension StageData {
  
  // MARK: - Result
  
  struct Result: Codable, Identifiable {
    let id = UUID().uuidString
    
    let startTime: Date?
    let endTime: Date?
    let rule: Rule?
    let stages: [StageElement]?
    let isFest: Bool
    
    enum CodingKeys: String, CodingKey {
      case startTime = "start_time"
      case endTime = "end_time"
      case rule, stages
      case isFest = "is_fest"
    }
  }
  
  // MARK: - Rule
  
  struct Rule: Codable {
    let key, name: String
  }
  
  // MARK: - StageElement
  
  struct StageElement: Codable, Hashable {
    let id: Int
    let name: String
    let image: URL?
  }
}
