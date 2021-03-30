//
//  LandMark.swift
//  Landmarks
//
//  Created by user on 04.03.2021.
//

import Foundation
import SwiftUI // для imageName
import CoreLocation // для CoordinateSpace

struct Landmark: Hashable, Codable, Identifiable{ //параметры изображения
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable{
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    private var imageName: String //читаемость и загрузка изображения
    var image: Image{
        Image(imageName)
    }
    //возвращает изображение объекта если оно существует
    var featureName: Image?{
        isFeatured ? Image(imageName + "_feature") : nil
    }
    private var coordinates: CoordinateSpace
    var locationCoordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct CoordinateSpace: Hashable, Codable {
        var latitude: Double
        var longitude: Double
        
    }
    
}
