//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by user on 15.03.2021.
//

import SwiftUI

struct FavoriteButton: View {
    //Привязка
   @Binding var isSet: Bool
    var body: some View {
        Button(action: {
            isSet.toggle()
        }){
            Image(systemName: isSet ? "star.fill" : "star")
                .foregroundColor(isSet ? Color.yellow : Color.gray)
                
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
