//
//  ProfileHost.swift
//  Landmarks
//
//  Created by user on 20.03.2021.
//

import SwiftUI


struct ProfileHost: View {
    @Environment(\.editMode) var editMode //режим редактирования
    @EnvironmentObject var modelData: ModelData //данные профиля пользователя из среды, чтобы передать управление данными хосту профиля.
  
    @State private var draftProfile = Profile.default
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20){
            HStack{
                //изменение редактирования после подтверждения пользователем
                if editMode?.wrappedValue == .active{
                    Button("Cancel"){
                        draftProfile = modelData.profile
                        editMode? .animation().wrappedValue = .inactive
                    }
                }
               Spacer()
               EditButton()
            }
            if editMode?.wrappedValue == .inactive{
            //ProfileSummary(profile: draftProfile)
            ProfileSummary(profile: modelData.profile)
            }else{
                //Text("Profile Editor")
                ProfileEditor(profile: $draftProfile)
                    .onAppear{ //при появлении
                    draftProfile = modelData.profile
                }
                    .onDisappear{ //при исчезновении
                    modelData.profile = draftProfile
                    
                }
               }
            }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData()) //данные модели в качестве объекта среды в предварительный просмотр.
    }
}
