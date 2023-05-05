//
//  LocalPushNotification.swift
//  SEKITOBA
//
//  Created by 南京兵 on 2023/05/04.
//

import UserNotifications

final class LocalPushNotification {
  static let shared = LocalPushNotification()
  private let center = UNUserNotificationCenter.current()
  
  func removeAllPendingNotificationRequests() {
    center.removeAllPendingNotificationRequests()
  }
  
  func notificationRequest(title: String, body: String, hour: Int = 0, minute: Int = 0) {
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    content.sound = .default
    
    let dateComponents = DateComponents(
      calendar: Calendar.current,
      timeZone: TimeZone.current,
      hour: hour,
      minute: minute
    )
    
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    center.add(request)
  }
  
  func showPushPermit(completion: ((Result<Bool, Error>) -> Void)? = nil) {
    center.requestAuthorization(options: [.alert, .badge, .sound]) { isGranted, error in
      if let error = error {
        debugPrint(error.localizedDescription)
        completion?(.failure(error))
        return
      }
      completion?(.success(isGranted))
    }
  }
}

