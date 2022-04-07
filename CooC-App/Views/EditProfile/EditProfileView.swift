//
//  EditProfileView.swift
//  CooC-App
//
//  Created by Youngseo Yoon on 2022/04/06.
//

import SwiftUI


struct EditProfileView: View {
    @State private var userName: String = ""
    @State private var userEmail: String = ""
    @State private var userAboutMe: String = ""

    
    
    var body: some View {
        VStack(spacing: 30) {
            UserImage()
            VStack(spacing: 15) {
                Text("Username")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 15, weight: .regular))
                TextField(
                    "45세 아조씨", text: $userName)
                .disableAutocorrection(true)
                .font(.subheadline)
                Divider()
                
                
                Text("E-mail")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 15, weight: .regular))
                TextField(
                    "oldman45@gmail.com", text: $userEmail)
                .disableAutocorrection(true)
                .font(.subheadline)
                Divider()
                
                
                Text("About me")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 15, weight: .regular))
                TextField(
                    "안녕 45살 소년이에요.", text: $userAboutMe)
                .disableAutocorrection(true)
                .font(.subheadline)
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
