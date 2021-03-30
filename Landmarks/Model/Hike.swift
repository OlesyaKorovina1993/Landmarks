//
//  Hike.swift
//  Landmarks
//
//  Created by user on 18.03.2021.
//
import Foundation

struct Hike: Codable, Hashable, Identifiable { //поход
    var id: Int
    var name: String
    var distance: Double //дистанция
    var observations: [Observation] // наблюдения
    
    static var formatter = LengthFormatter()
    
    var distanceText: String{
        return Hike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }
    
    struct Observation: Codable, Hashable {
        var distanceFromStart: Double
        var elevation: Range<Double> //высота, поднятие
        var pace: Range<Double> //темп, скорость
        var heartRate: Range<Double> // сердцебиение
    }
}
