//
//  EditProfileNavigationBar.swift
//  CooC-App
//
//  Created by 이영준 on 2022/04/09.
//

import SwiftUI

struct EditProfileNavigationBar: View {
    // @EnvironmentObject var userProfileData: UserProfileData
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack{
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }){
                Text("Cancel")
                    .font(.body)
                    .foregroundColor(Color.orange)
                    .padding()
            }
            
            Spacer()
            
            Text("Edit Profile")
                .font(.body)
                .bold()
            
            Spacer()
            
            Button(action: {
                EditProfileView()
                presentationMode.wrappedValue.dismiss()
            }){
                Text("Done")
                    .font(.body)
                    .foregroundColor(Color.orange)
                    .padding()
            }
        }
        .accentColor(ColorManager.mainOrange)
    }
}

struct EditProfileNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileNavigationBar()
    }
}
