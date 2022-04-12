//
//  UserCategory.swift
//  CooC-App
//
//  Created by Youngseo Yoon on 2022/04/06.
//

import SwiftUI

struct UserCategory: View {
    @State private var userInterest: String = ""
    @State private var showCategoryModal: Bool = false
    @EnvironmentObject var userProfileData: UserProfileData
    
    var body: some View {

        VStack(alignment: .leading, spacing: 10) {
            Text("Interest")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 15, weight: .regular))
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
            Button(action: {
                self.showCategoryModal = true
                
            }) {
                Text("Click to add category preferences")
            }
            .sheet(isPresented: self.$showCategoryModal) {
                PickCategoryModal(showCategoryModal: $showCategoryModal)
            }
            
            Divider()
            
        }
        .accentColor(ColorManager.mainOrange)
    }
}

struct EditProfileUserInfo_Previews: PreviewProvider {
    static var previews: some View {
        UserCategory()
    }
}
