//
//  UserImage.swift
//  CooC-App
//
//  Created by Youngseo Yoon on 2022/04/08.
//

import SwiftUI

struct UserImage: View {
    
    @State private var isShowingPhotoPicker = false
    @EnvironmentObject var userProfileData: UserProfileData

//    @State private var avatarImage = UIImage(named: "profileImageDefault")!
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: nil, height: 250, alignment: .center)
                .foregroundColor(ColorManager.grayBackground)
//                .edgesIgnoringSafeArea(.top)
            
            ZStack(alignment: .bottomTrailing) {
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 170, height: 170, alignment: .center)
                        .foregroundColor(.white)
                    Image(uiImage: userProfileData.profilePicture)
                        .resizable()
                        .frame(width: 160, height: 160, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                }
                
                
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
                    PhotoPicker()
                })
            }
        }
    }
}

struct UserImage_Previews: PreviewProvider {
    static var previews: some View {
        UserImage()
    }
}
