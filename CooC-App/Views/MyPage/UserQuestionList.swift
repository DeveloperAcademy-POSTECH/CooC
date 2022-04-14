//
//  UserQuestionList.swift
//  CooC-App
//
//  Created by 이영준 on 2022/04/09.
//

import SwiftUI

struct UserQuestionList: View {
    let chosenButton = Color(red: 1, green: 152/255, blue: 0)
    let notChosenButton = Color(red: 1, green: 214/255, blue: 146/255)
    let questionList = storyListData
    
    @EnvironmentObject var userProfileData: UserProfileData

    @State private var currentIndex: Int = 0 
    
    @State private var clickCheck = true
    
    
    var body: some View {
        HStack {
            Button(action: {
                self.clickCheck.toggle()
            }){
                Text("\(userProfileData.profileName) 님의 고민")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 180, height: 30)
                    .background(self.clickCheck ? chosenButton : notChosenButton)
                    .cornerRadius(12)
            }
            
            
            Button(action: {
                self.clickCheck.toggle()
            }){
                Text("\(userProfileData.profileName) 님이 응답한 고민")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 180, height: 30)
                    .background(self.clickCheck ?  notChosenButton : chosenButton)
                    .cornerRadius(12)
                    
            }
            
        }

        if self.clickCheck {
            List{
                ForEach(0..<detailData.count-5){ currentIndex in
                    NavigationLink(destination: TopicResultDetailPage(dataIndex: .constant(currentIndex))){
                            Text(detailData[currentIndex].title)
                                .frame(width: 200, alignment: .leading)
                            Text(detailData[currentIndex].date)
                                .foregroundColor(Color.gray)
                        }
                }
            }
        } else {
            List{
                ForEach(4..<detailData.count){ currentIndex in
                    NavigationLink(destination: TopicResultDetailPage(dataIndex: .constant(currentIndex))){
                            Text(detailData[currentIndex].title)
                                .frame(width: 200, alignment: .leading)
                            Text(detailData[currentIndex].date)
                                .foregroundColor(Color.gray)
                        }
                }
            }
        }
    }
}

struct UserQuestionList_Previews: PreviewProvider {
    static var previews: some View {
        UserQuestionList()
    }
}
