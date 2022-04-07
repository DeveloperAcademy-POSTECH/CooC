//
//  CustomNavigationBar.swift
//  CooC-App
//
//  Created by peo on 2022/04/06.
//

import SwiftUI

struct CustomNavigationBar: View {
    var body: some View {
        VStack {
            ZStack(alignment: .trailing) {
                HStack {
                    Spacer()
                    
                    Text("Home")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                
                Button(action: {
                    // TODO: 업로드 페이지 불러오기
                }) {
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: 24, height: 24)
                        .padding(.bottom, 3)
                        .padding(.trailing, 15)
                }
            }
            .padding(.top, 30)
            .padding(.bottom, 5)
            
            SearchBar()
                .padding(.horizontal, 15)
            
            FilterButtonList()
                .padding(.bottom, 10)
        }
        .background(
            Rectangle()
                .fill(.white)
                .frame(width: .infinity, height: 140)
        )
    }
}

struct CustomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBar()
    }
}
