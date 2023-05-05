//
//  DateFormatterExtension.swift
//  SEKITOBA
//
//  Created by 南京兵 on 2023/05/05.
//

import Foundation

extension DateFormatter {
  static let iso8601: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    dateFormatter.calendar = Calendar(identifier: .iso8601)
    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    dateFormatter.locale = Locale(identifier: "ja_JP")
    return dateFormatter
  }()
}
