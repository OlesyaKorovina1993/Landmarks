//
//  NotificationController.swift
//  WatchLandmarks Extension
//
//  Created by user on 22.03.2021.
//

import WatchKit
import SwiftUI
import UserNotifications

class NotificationController: WKUserNotificationHostingController<NotificationView> {
    var title: String?
    var message: String?
    var landmark: Landmark? //Эти свойства хранят значения о входящем уведомлении
    
    let landmarkIndexKey = "landmarkIndex" //для извлечения индекса ориентира из уведомления.

    override var body: NotificationView {
        NotificationView(
            title: title,
            message: message,
            landmark: landmark
        )
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        
    
    }

    override func didReceive(_ notification: UNNotification) {
        let modelData = ModelData()
        
        let notificationData = notification.request.content.userInfo as? [String: Any]
        let aps = notificationData?["aps"] as? [String: Any]
        let alert = aps?["alert"] as? [String: Any]
        
        title = alert?["title"] as? String
        message = alert?["body"] as? String
        
        if let index = notificationData?[landmarkIndexKey] as? Int{
            landmark = modelData.landmarks[index]
        }
        // This method is called when a notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
    }
}
