//
//  TopicListTitle.swift
//  CooC-App
//
//  Created by peo on 2022/04/06.
//

import SwiftUI

struct TopicListTitle: View {
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 24, weight: .bold, design: .default))
                .lineLimit(2)
                .truncationMode(.tail)
            
            Spacer()
        }
    }
}

struct TopicListTitle_Previews: PreviewProvider {
    static var previews: some View {
        TopicListTitle(title: "")
    }
}
