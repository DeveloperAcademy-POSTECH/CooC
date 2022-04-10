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
    
    let recentSearchText = [
        "iPhone 13",
        "MacBook Pro",
        "Air Pods",
        "iPods",
        "Apple TV",
        "Home Pod",
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Recent search")
                    .font(.title3)
                    .fontWeight(.bold)
                Spacer()
                
                Button(action: {
                    // TODO: 모두 지우기
                }) {
                    Image(systemName: "trash.fill")
                }
                .font(.title3)
            }
            .padding(.top, 20)
            
            ScrollView {
                LazyVGrid(columns: columns,  spacing: 15) {
                    ForEach(recentSearchText, id: \.self) { text in
                        NavigationLink(destination: SearchResultView(searchText: text)) {
                            RecentSearchItem(text: text)
                                .foregroundColor(.black)
                        }
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
        RecentSearchList()
    }
}
