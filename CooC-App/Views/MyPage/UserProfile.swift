//
//  UserProfile.swift
//  CooC-App
//
//  Created by 이영준 on 2022/04/09.
//

import SwiftUI

struct UserProfile: View {
    let titleBackground = Color(red: 224/255, green: 224/255, blue: 224/255)
    
    @State private var avatarImage = UIImage(named: "profileImageDefault")!
    
    @EnvironmentObject var userProfileData: UserProfileData
    
    var body: some View {
        VStack{
            ZStack{
                titleBackground.frame(width: 390, height: 210)
                
                VStack{
                    Spacer().frame(height: 15)
                    
                    HStack{
                        Spacer().frame(width: 340)
                        
                        NavigationLink(destination: EditProfileView()){
                            Image(systemName: "square.and.pencil")
                                .font(.system(size: 25))
                                .foregroundColor(.orange)
                        }
                    }
                    
                    HStack(spacing: 30){
                        Spacer().frame(width: 10)
                        
                        Image(uiImage: userProfileData.profilePicture)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(20)
                            .frame(width: 130, height: 130)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .padding(EdgeInsets(top: 10, leading: -80, bottom: 20, trailing: 0))
                        
                        
                        VStack(alignment: .leading){
                            Text(userProfileData.profileName)
                                .font(.title2)
                            
                            Spacer().frame(height: 5)
                            
                            Text(userProfileData.profileIntroduce)
                                .font(.body)
                            
                            Spacer().frame(height: 15)
                            
                            Text("Category")
                                .font(.body)
                            
                            Spacer().frame(height: 10)

                            HStack(spacing: 10){
                                ForEach(profileData[2].category, id: \.self){
                                    Text($0)
                                        .font(.system(size: 12))
                                        .foregroundColor(Color.black)
                                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke(Color.orange, lineWidth: 2)
                                            )
                                }
                            }
                            Spacer().frame(height: 10)
                        }
                    }
                }
            }
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
