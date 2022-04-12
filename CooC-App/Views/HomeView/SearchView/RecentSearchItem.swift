//
//  RecentSearchItem.swift
//  CooC-App
//
//  Created by peo on 2022/04/07.
//

import SwiftUI

struct RecentSearchItem: View {
    var text: String
    @EnvironmentObject var searchViewState: SearchViewState
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                NavigationLink(destination: SearchResultView(searchText: text)) {
                    Text(text)
                    Spacer()
                }
                
                Image(systemName: "xmark")
                    .onTapGesture {
                        searchViewState.recentSearchTexts.remove(at: searchViewState.recentSearchTexts.firstIndex(of: text)!)
                        UserDefaults.standard.set(searchViewState.recentSearchTexts, forKey: "recentSearch")
                    }
            }
            .font(.subheadline)
            .foregroundColor(.black)
            
            Divider()
                .padding(.vertical, 10)
        }
    }
}

struct RecentSearchItem_Previews: PreviewProvider {
    static var previews: some View {
//        RecentSearchItem()
        Text("")
    }
}
