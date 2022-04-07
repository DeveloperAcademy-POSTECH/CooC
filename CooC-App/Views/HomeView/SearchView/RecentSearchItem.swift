//
//  RecentSearchItem.swift
//  CooC-App
//
//  Created by peo on 2022/04/07.
//

import SwiftUI

struct RecentSearchItem: View {
    var text = ""
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Text(text)
                
                Spacer()
                
                Image(systemName: "xmark")
            }
            .font(.subheadline)
            
            Divider()
                .padding(.vertical, 10)
        }
        .frame(width: 170)
    }
}

struct RecentSearchItem_Previews: PreviewProvider {
    static var previews: some View {
        RecentSearchItem()
    }
}
