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
            HStack(alignment: .center) {
                SearchBar()
                    .padding(.trailing, 10)
                
                Button(action: {
                    // TODO: 업로드 페이지 불러오기
                }) {
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: 30, height: 30)
                        .padding(.bottom, 3)
                }
            }
            .padding(.horizontal, 15)
            .padding(.top, 30)
            
            FilterButtonList()
                .padding(.bottom, 10)
        }
        .background(
            Rectangle()
                .fill(.white)
                .frame(width: .infinity, height: 110)
        )
    }
}

struct CustomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBar()
    }
}
