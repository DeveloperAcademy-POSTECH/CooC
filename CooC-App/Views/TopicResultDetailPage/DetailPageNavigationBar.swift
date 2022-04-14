//
//  DetailPageNavigationBar.swift
//  CooC-App
//
//  Created by 이영준 on 2022/04/14.
//

import SwiftUI

struct DetailPageNavigationBar: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack{
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }){
                Text("Cancel")
                    .font(.body)
                    .foregroundColor(ColorManager.mainOrange)
                    .padding()
            }
            
            Spacer()
            
            Text("Detail Page")
                .font(.body)
                .bold()
            
            Spacer()
            Spacer()
        }
        .accentColor(ColorManager.mainOrange)
    }
}

struct DetailPageNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        DetailPageNavigationBar()
    }
}
