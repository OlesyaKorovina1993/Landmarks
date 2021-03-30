//
//  MapView.swift
//  Landmarks
//
//  Created by user on 02.03.2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    var body: some View {
       Map(coordinateRegion: $region)
        //вычисление области на основе текущей координаты
        .onAppear {
            setRegion(coordinate)
        }
    }
    //метод, обновляющий регион на основе значения координат
    private func setRegion(_ coordinate:
        CLLocationCoordinate2D){
        region = MKCoordinateRegion(
        center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.988867, longitude: -116.006507))
    }
}
