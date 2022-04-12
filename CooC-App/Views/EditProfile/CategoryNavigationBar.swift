//
//  CategoryNavigationBar.swift
//  CooC-App
//
//  Created by Youngseo Yoon on 2022/04/12.
//

import SwiftUI

struct CategoryNavigationBar: View {
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
                presentationMode.wrappedValue.dismiss()
            }){
                Text("Done")
                    .font(.body)
                    .foregroundColor(Color.orange)
                    .padding()
            }
        }.accentColor(ColorManager.mainOrange)
    }
}

struct CategoryNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        CategoryNavigationBar()
    }
}
