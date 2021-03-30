//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by user on 17.03.2021.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        GeometryReader{ geometry in
        Path{path in
            var wigth: CGFloat = min(geometry.size.width, geometry.size.height) // добавляем геометрию и мин размер
            var height = wigth
            //масштабирование
            let xScale: CGFloat = 0.832
            // смещение / компенсирование
            let xOffset = (wigth * (1.0 - xScale))/2.0
            wigth *= xScale
            //перемещение курсора в пределах формы
            path.move(
                to: CGPoint(
                    x: wigth * 0.95 + xOffset,
                    y: height * (0.20 + HexagonParametrs.adjustment) //корректировка кривых Безье
                )
            )
            HexagonParametrs.segments.forEach{ segment in
                //Последовательные вызовы для начала линии с предыдущей точки и продолжения до новой точки
                path.addLine(
                    to: CGPoint(
                        x: wigth * segment.line.x + xOffset,
                        y: height * segment.line.y
                    )
                )
                path.addQuadCurve(
                    to: CGPoint (
                        x: wigth * segment.curve.x + xOffset,
                        y: height * segment.curve.y
                    ),
                    control: CGPoint(
                        x: wigth * segment.control.x + xOffset,
                        y: height * segment.control.y
                    )
                )
                
            }
            
        }
        //.fill(Color.black)
        .fill(LinearGradient(
            gradient: Gradient(colors:[Self.gradientStart,Self.gradientEnd]),
            startPoint: UnitPoint(x: 0.5, y: 0.0),
            endPoint: UnitPoint(x: 0.5, y: 0.6)
            
                )
            )
        }
        //соотношение сторон
        .aspectRatio(1, contentMode: .fit)
    }
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
