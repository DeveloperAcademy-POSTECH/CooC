//
//  EditProfileView.swift
//  CooC-App
//
//  Created by Youngseo Yoon on 2022/04/06.
//

import SwiftUI


struct EditProfileView: View {
//    @State private var userName: String = ""
//    @State private var userEmail: String = ""
//    @State private var userAboutMe: String = ""
    @EnvironmentObject var userProfileData: UserProfileData

    
    var body: some View {
        EditProfileNavigationBar()
        VStack(spacing: 30) {
            UserImage()
                .navigationBarHidden(true)
            VStack(spacing: 15) {
                Text("Username")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(ColorManager.subCobaltBlue)
                TextField(
                    "45세 아조씨", text: $userProfileData.profileName)
                .disableAutocorrection(true)
                .font(.subheadline.bold())
                .foregroundColor(ColorManager.subCobaltBlue)

                Divider()
                
                
                Text("E-mail")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(ColorManager.subCobaltBlue)

                TextField(
                    "oldman45@gmail.com", text: $userProfileData.profileEmail)
                .disableAutocorrection(true)
                .font(.subheadline.bold())
                .foregroundColor(ColorManager.subCobaltBlue)

                Divider()
                
                
                Text("About me")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(ColorManager.subCobaltBlue)

                TextField(
                    "안녕 45살 소년이에요.", text: $userProfileData.profileIntroduce)
                .disableAutocorrection(true)
                .font(.subheadline.bold())
                .foregroundColor(ColorManager.subCobaltBlue)

                Divider()
                
                UserCategory()
                
                
            }
            .padding()
            .background(Color.white)
            
            Spacer()
        }
        
    }
}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
