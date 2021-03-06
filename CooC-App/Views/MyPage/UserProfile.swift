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
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 140, height: 140)
                                .foregroundColor(.white)
                            Image(uiImage: userProfileData.profilePicture)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(25)
                                .frame(width: 130, height: 130)
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                        }
                        .frame(width: 140, alignment: .leading)
                        .padding(EdgeInsets(top: 10, leading: -20, bottom: 20, trailing: 0))
                        
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
                                ForEach(0..<9){ row in
                                    if userProfileData.isChecked[row] == true {
                                        Text("\(categoryData[row].title)")
                                            .padding(4)
                                            .foregroundColor(ColorManager.mainOrange)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(color: .gray, radius: 2, x: 0, y: 2))
                                    }
                                }
                            }
                            Spacer().frame(height: 10)
                        }
                        .frame(width: 200, alignment: .leading)
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
