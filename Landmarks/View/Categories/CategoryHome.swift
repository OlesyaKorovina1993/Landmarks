//
//  CategoryHome.swift
//  Landmarks
//
//  Created by user on 19.03.2021.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    var body: some View {
        NavigationView{
            List{
                PageView(pages:ModelData().features.map{FeatureCard(landmark: $0)})
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                
                /*modelData.features[0].image
                    .resizable()
                    .scaledToFill() //масштабируется до заполнения ( Fit - по размеру)
                    .frame(height: 200)//масштаб
                    .clipped() //обрезание
                    .listRowInsets(EdgeInsets()) //нулевое значение по краям*/
                
                
                ForEach(modelData.categories.keys.sorted(), id: \.self){key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!) //передача всех данных по озерам горям и рекам
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(InsetListStyle()) //убрать промежутки по бокам
            .navigationTitle("Featured")
            .toolbar{
                Button(action:{showingProfile.toggle()}){
                    Image(systemName: "person.crop.circle")
                        .accessibilityLabel("User Profile")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
            }.environmentObject(modelData)
         
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
