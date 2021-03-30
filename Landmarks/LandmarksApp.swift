//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by user on 02.03.2021.
//

import SwiftUI

@main
struct LandmarksApp: App {
   @StateObject private var modelData = ModelData()
  
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        //для часов
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
    }
}

