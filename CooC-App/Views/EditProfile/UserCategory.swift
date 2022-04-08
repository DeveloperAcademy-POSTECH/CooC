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

        VStack {
            Text("Interest")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 15, weight: .regular))
            Button(action: {
                print("카테고리 고르기 버튼")
                self.showCategoryModal = true
                
            }) {
                Text("카테고리 고르기 모달 팝업")
            }.sheet(isPresented: self.$showCategoryModal) {
                PickCategoryModal()
            }

            
            Divider()
        }
    }
}

struct EditProfileUserInfo_Previews: PreviewProvider {
    static var previews: some View {
        UserCategory()
    }
}
