//
//  StageGateway.swift
//  SEKITOBA
//
//  Created by 南京兵 on 2023/05/04.
//

import Alamofire
import Foundation

final class StageGateway{
  
  func getStage(matchType: MatchType = .bankaraChallenge, timezone: StageTimeZone = .now) async -> Result<StageData, Error> {
    let request = URLRequest(url: URL(string: "https://spla3.yuu26.com/api/\(matchType.rawValue)/\(timezone.rawValue)")!)
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601)
    let response = await AF.request(request).serializingDecodable(StageData.self, decoder: decoder).response
    
    switch response.result {
    case .success(let stateData):
      return .success(stateData)
    case .failure(let error):
      return .failure(error)
    }
  }
}
