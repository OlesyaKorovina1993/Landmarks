//
//  Profile.swift
//  Landmarks
//
//  Created by user on 20.03.2021.
//

import Foundation


struct Profile {
    var username: String
    //предпочитаемые уведомления
    var prefersNotifications = true
    var seasonalPhono = Season.winter
    //данные цели
    var goalDate = Date()
    
    static let `default` = Profile(username: "g_kumar") //по умолчанию
    enum Season: String, CaseIterable, Identifiable{
        case spring = "🌹"
        case summer = "☀️"
        case autumn = "🍁"
        case winter = "☃️"
        
        var id: String{self.rawValue}  //самост сырое значение
    }
}
