//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by user on 20.03.2021.
//

import SwiftUI
//редактор профиля
struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date>{
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    var body: some View {
        List{
        HStack {
            Text("Username")
                .bold()
            Divider()
            TextField("Username", text: $profile.username) //текстовое поле
           }
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications") //включить уведомления
                    .bold()
            }
            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo")
                    .bold()
                Picker("Seasonal Photo", selection: $profile.seasonalPhono){
                    ForEach(Profile.Season.allCases){ season in
                        Text(season.rawValue)
                            .tag(season)
                        
                    }
                    
                }
                .pickerStyle(SegmentedPickerStyle()) //расположение в ряд
            }
            DatePicker(selection:$profile.goalDate, in: dateRange, displayedComponents: .date){
                Text("Goal Date")
                    .bold()
                
            }
            
        }
      
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
