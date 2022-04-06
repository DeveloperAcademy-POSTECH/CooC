//
//  EditProfile.swift
//  CooC-App
//
//  Created by Youngseo Yoon on 2022/04/06.
//

import SwiftUI

struct EditProfile: View {
    @State private var userName: String = ""
    @State private var userEmail: String = ""
    @State private var userAboutMe: String = ""
    @State private var userInterest: String = ""



    var body: some View {
        VStack {
            Image("profileImageDefault")
                .resizable()
                .frame(width: 160, height: 160)
            //이미지 위로 보내야함 
            .border(.gray, width: 5)

            VStack {
                VStack{
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
                    
                    Text("Interest")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 15, weight: .regular))
                        

                }
                .padding()
                
            }
            
        }
    }
}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile()
    }
}
