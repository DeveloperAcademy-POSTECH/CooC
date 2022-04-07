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
    
    @State private var isShowingPhotoPicker = false
    @State private var avatarImage = UIImage(named: "profileImageDefault")!
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                
//                RoundedRectangle(cornerRadius: 25)
//                    .frame(width: 170, height: 170, alignment: .center)
                Image(uiImage: avatarImage)
                    .resizable()
                    .frame(width: 160, height: 160, alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                
                //이미지 정렬 필요
                
                Circle()
                    .frame(width: 42, height: 42)
                    .foregroundColor(ColorManager.mainOrange)
                Button(action: { isShowingPhotoPicker = true }) {
                    Image(systemName: "photo.circle")
                        .resizable()
                }
                .frame(width: 42, height: 42)
                .accentColor(.white)
                .sheet(isPresented: $isShowingPhotoPicker, content: {
                    PhotoPicker(avatarImage: $avatarImage)
                })
            }
            
            
            VStack {
                
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
                
                EditProfileUserCategory()
                
            }
            .padding()

            
        }
    }
}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile()
    }
}
