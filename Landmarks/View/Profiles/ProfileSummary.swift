//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by user on 20.03.2021.
//

import SwiftUI


struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    var profile: Profile
    
    var body: some View {
      ScrollView{
        VStack(alignment: .leading, spacing: 10){
            Text(profile.username)
                .bold()
                .font(.title)
        
            Text("Notifications: \(profile.prefersNotifications ? "On":"Off")") //уведомления
            Text("Seasonal Photos: \(profile.seasonalPhono.rawValue)")
            Text("Goal Date: ") + Text(profile.goalDate, style: .date)
            
            Divider()
            
            
            
            VStack (alignment: .leading){
                Text("Completed Badges") //завершенные значки
                    .font(.headline)
                
                ScrollView (.horizontal){
                HStack {
                    HikeBadge(name: "First Hike")

                    HikeBadge(name: "Earth Day") //земной день
                         .hueRotation(Angle(degrees: 90)) //вращение оттенка
                    HikeBadge(name: "Tenth Hike") //10-ый поход
                         .grayscale(0.5) //оттенки серого
                         .hueRotation(Angle(degrees: 200))
                     }
                .padding(.bottom)
                 }
               }
            
            Divider()
            VStack(alignment: .leading){
                Text("Recent Hikes") //недавние походы
                    .font(.headline)
                
                HikeView(hike: modelData.hikes[0])
            }
            
        
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
   }
}
