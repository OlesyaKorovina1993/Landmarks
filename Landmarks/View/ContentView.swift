//
//  ContentView.swift
//  Landmarks
//
//  Created by user on 02.03.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured //переменная состаяния для выбора вкладкиб значение по умолчанию
    enum Tab {
        //перечисление вкладок для отображения
        case featured
        case list
    }
    var body: some View {
        // представление вкладки для двух этих групп
        TabView(selection: $selection){
        CategoryHome()
            //ярлык для вкладки
            .tabItem {
                Label("Featured", systemImage: "star")
            }
            .tag(Tab.featured)
        
        LandmarkList()
            //ярлык для вкладки
            .tabItem {
                Label("List", systemImage: "list.bullet")
            }
            .tag(Tab.list)
       }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(ModelData())
    }
}
