//
//  Badge.swift
//  Landmarks
//
//  Created by user on 17.03.2021.
//

import SwiftUI

struct Badge: View {
    static let rotationCount = 8 //счетчик оборотов
    var badgeSymbols: some View{
        ForEach(0..<Badge.rotationCount){ i in
        //RotatedBadgeSymbol(angle: Angle(degrees: 0))
            RotatedBadgeSymbol(angle: .degrees(Double(i) / Double(Badge.rotationCount)) * 360.0)
        }
            .opacity(0.5) //непрозрачность
    }
    var body: some View {
        ZStack {
            BadgeBackground()
            GeometryReader{ geometry in
            badgeSymbols
                .scaleEffect(1.0/4.0, anchor: .top) //масштабирование
                .position(x: geometry.size.width/2, y: (3.0/4.0) * geometry.size.height)
            }
           
        }
        
        .scaledToFit()
        
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
