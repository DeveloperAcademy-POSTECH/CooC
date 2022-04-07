//
//  EditProfileUserCategory.swift
//  CooC-App
//
//  Created by Youngseo Yoon on 2022/04/06.
//

import SwiftUI

struct EditProfileUserCategory: View {
    @State private var userInterest: String = ""
    
    
    var body: some View {

        
        VStack {
            Text("Interest")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 15, weight: .regular))
//            Button(action: { print(" ") }) {
//                Text(" ")
//                frame(maxWidth: .infinity)
//            }
            
            Divider()
        }
    }
}

struct EditProfileUserInfo_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileUserCategory()
    }
}
