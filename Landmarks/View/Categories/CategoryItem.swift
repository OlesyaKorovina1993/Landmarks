//
//  CategoryItem.swift
//  Landmarks
//
//  Created by user on 20.03.2021.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark
    var body: some View {
        VStack(alignment: .leading){
        landmark.image
            .renderingMode(.original)
            .resizable() //изменяемый размер
            .frame(width: 155, height: 155)
            .cornerRadius(5)//угловой радиус
        Text(landmark.name)
            .font(.caption)
            .foregroundColor(.primary)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: ModelData().landmarks[0])
    }
}
