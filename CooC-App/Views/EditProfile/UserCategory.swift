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
    
    var body: some View {

        VStack(alignment: .leading, spacing: 10) {
            Text("Interest")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 15, weight: .regular))
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
