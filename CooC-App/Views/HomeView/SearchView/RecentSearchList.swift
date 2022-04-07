//
//  RecentSearchList.swift
//  CooC-App
//
//  Created by peo on 2022/04/07.
//

import SwiftUI

struct RecentSearchList: View {
    var body: some View {
        VStack {
            HStack {
                Text("Recent search")
                    .font(.title3)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.top, 20)
        }
        .padding(.horizontal, 15)
        
    }
}

struct RecentSearchList_Previews: PreviewProvider {
    static var previews: some View {
        RecentSearchList()
    }
}
