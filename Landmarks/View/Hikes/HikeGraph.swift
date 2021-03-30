//
//  HikeGraph.swift
//  Landmarks
//
//  Created by user on 19.03.2021.
//

import SwiftUI

struct HikeGraph: View {
    var hike: Hike
    var path: KeyPath<Hike.Observation, Range<Double>>
    
    var color: Color{
        switch path{ //перекючить путь
        case \.elevation:
            return .gray
        case \.heartRate:
            return Color(hue: 0, saturation: 0.5, brightness: 0.7)
        //оттенок насыщенность яркость
        case \.pace:
            return Color(hue: 0.7, saturation: 0.4, brightness: 0.7)
        default: //по умолчанию
            return .black
        }
    }
    var body: some View {
        //данные
        let  data = hike.observations
        //общий диапазон
        let overallRange = rangeOfRanges(data.lazy.map { $0[keyPath: path]})
        //максимальная величина
        let maxMagnitude = data.map{magnitude(of: $0[keyPath: path])}.max()!
        //соотношение высоты
        let heightRatio = 1 - CGFloat(maxMagnitude/magnitude(of: overallRange))
        return GeometryReader { proxy in
            HStack(alignment: .bottom, spacing: proxy.size.width / 120){
                ForEach(Array(data.enumerated()), id: \.offset){index, observation in
                    GraphCapsule(
                    index: index,
                    height: proxy.size.height,
                    range: observation[keyPath: path],
                    overallRange: overallRange)
                    .colorMultiply(color)
                }
                .offset(x: 0, y: proxy.size.height * heightRatio)
            }
        }
            
    }
}


func rangeOgRanges<C: Collection>(_ ranges: C) -> Range<Double>
    where C.Element == Range<Double>{
    guard !ranges.isEmpty else { return 0..<0}
    let low = ranges.lazy.map{$0.lowerBound}.min()! //нижняя граница
    let high = ranges.lazy.map{$0.upperBound}.max()! //верхняя граница
    return low..<high
}
//magnitude - величина размеры
func magnitude(of range: Range<Double>) -> Double{
    return range.upperBound - range.lowerBound
}
struct HikeGraph_Previews: PreviewProvider {
    static var hike = ModelData().hikes[0]
    static var previews: some View {
        Group{
            HikeGraph(hike: hike, path: \.elevation)
                .frame(height: 200)
            HikeGraph(hike: hike, path: \.heartRate)
                .frame(height: 200)
            HikeGraph(hike: hike, path: \.pace)
                .frame(height: 200)
        }
    }
}
