//
//  RecentSearchList.swift
//  CooC-App
//
//  Created by peo on 2022/04/07.
//

import SwiftUI

struct RecentSearchList: View {
    let columns = [
            GridItem(.flexible(), spacing: 30),
            GridItem(.flexible(), spacing: 30),
    ]
    
    @EnvironmentObject var searchViewState: SearchViewState
    
    var body: some View {
        VStack {
            HStack {
                Text("Recent search")
                    .font(.title3)
                    .fontWeight(.bold)
                Spacer()
                
                Button(action: {
                    searchViewState.recentSearchTexts = []
                    UserDefaults.standard.set(searchViewState.recentSearchTexts, forKey: "recentSearch")
                }) {
                    Image(systemName: "trash.fill")
                }
                .font(.title3)
            }
            .padding(.top, 20)
            
            ScrollView {
                LazyVGrid(columns: columns,  spacing: 15) {
                    ForEach(searchViewState.recentSearchTexts, id: \.self) { text in
                        RecentSearchItem(text: text)
                    }
                }
                .padding(.top, 20)
            }
            
            
        }
        .padding(.horizontal, horizontalDefaultPadding)
        
    }
}

struct RecentSearchList_Previews: PreviewProvider {
    static var previews: some View {
//        RecentSearchList()
        Text("")
    }
}
