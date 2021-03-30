//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by user on 10.03.2021.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable() //изменяемый размер
                .frame(width: 50, height: 50) //рамка
                .cornerRadius(5)
            VStack (alignment: .leading) {
                Text(landmark.name)
                    .bold()
                Text(landmark.park)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer() //разделитель
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                   
            }
        }
        .padding(.vertical, 4)
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])//первый элемент массива
            
            LandmarkRow(landmark: landmarks[1])//второй элемент массива
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
