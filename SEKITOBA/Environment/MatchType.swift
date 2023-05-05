//
//  MatchType.swift
//  SEKITOBA
//
//  Created by 南京兵 on 2023/05/05.
//

enum MatchType: String {
  /// レギュラーマッチ
  case regular
  /// バンカラマッチチャレンジ
  case bankaraChallenge = "bankara-challenge"
  /// バンカラマッチオープン
  case bankaraOpen = "bankara-open"
  /// フェス
  case fest
  /// Xマッチ
  case x
  /// サーモンラン
  case coopGrouping = "coop-grouping"
  /// バイトチームコンテスト
  case coopGroupingTeamContest = "coop-grouping-team-contest"
  
  var description: String {
    switch self {
    case .regular:
      return "レギュラー"
    case .bankaraChallenge:
      return "チャレンジ"
    case .bankaraOpen:
      return "オープン"
    case .fest:
      return "フェス"
    case .x:
      return "X"
    case .coopGrouping:
      return "サーモンラン"
    case .coopGroupingTeamContest:
      return "コンテスト"
    }
  }
}
