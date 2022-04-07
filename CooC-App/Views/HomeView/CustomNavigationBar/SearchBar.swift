//
//  SearchBar.swift
//  CooC-App
//
//  Created by peo on 2022/04/06.
//

import SwiftUI

struct SearchBar: View {
    var body: some View {
        NavigationLink(destination: {
            SearchView()
        }) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                Text("Search topics")
                    .foregroundColor(.black)
                
                Spacer()
            }
            .padding(.leading, 10)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(.gray)
                    .frame(width: .infinity, height: 32)
            )
        }        
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
