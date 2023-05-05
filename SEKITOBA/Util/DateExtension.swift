//
//  DateExtension.swift
//  SEKITOBA
//
//  Created by 南京兵 on 2023/05/04.
//

import Foundation

extension Date {
  var time: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    return dateFormatter.string(from: self)
  }
  
  var components: DateComponents {
    let calendar = Calendar.current
    return DateComponents(
      calendar: Calendar.current,
      timeZone: TimeZone.current,
      year: calendar.component(.year, from: self),
      month: calendar.component(.month, from: self),
      day: calendar.component(.day, from: self),
      hour: calendar.component(.hour, from: self),
      minute: calendar.component(.minute, from: self),
      second: calendar.component(.second, from: self)
    )
  }
}
