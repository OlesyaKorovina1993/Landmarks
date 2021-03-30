//
//  LandmarkList.swift
//  Landmarks
//
//  Created by user on 10.03.2021.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark]{
        
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly||landmark.isFavorite)
        }
    }
    
    var body: some View {
        /*List{
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
 */
        /*List(landmarks, id: \.id)*/
        //Если id не известно и минус параметр Identifiable
        NavigationView{
            List{
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites Only")
                }
                ForEach(filteredLandmarks) {landmark in
            NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
        LandmarkRow(landmark: landmark)
                   }
                }
            }
        .navigationTitle("Landmarks") //Заголовок
        .frame(minWidth: 300)
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        /*Group {
            ForEach(["iPhone SE (2nd generation)", "iPhone XS Max", "iPad Pro (11 - inch) (2nd generation)"], id: \.self) { deviceName in
 */
            LandmarkList()
               .environmentObject(ModelData())
               /* .previewDevice(PreviewDevice(rawValue: deviceName))//для определенного устройства
                .previewDisplayName(deviceName)//имя устройства
            }
    
        }*/
      }
}
