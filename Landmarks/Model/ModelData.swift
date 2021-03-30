//
//  ModelData.swift
//  Landmarks
//
//  Created by user on 04.03.2021.
//

import Foundation
import Combine

//var landmarks: [Landmark] = load("landmarkData.json")

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    
    @Published var profile = Profile.default
    
    var features: [Landmark]{
        landmarks.filter {$0.isFeatured} // только значения true
    }
    
    var categories: [String: [Landmark]]{
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue} //исходное значение
        )
    }
   }


func load<T: Decodable>(_ filename: String ) ->T{
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Coudn`t file \(filename) in mane bundle.")
    }
    
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("Coudn`t load \(filename) in mane bundle:\n\(error).")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("Coudn`t parse \(filename) as \(T.self):\n\(error)")
    }
    
}
