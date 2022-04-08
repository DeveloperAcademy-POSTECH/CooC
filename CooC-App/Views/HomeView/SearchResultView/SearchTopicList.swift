//
//  SearchTopicList.swift
//  CooC-App
//
//  Created by peo on 2022/04/07.
//

import SwiftUI

struct SearchTopicList: View {
    let columns = [
            GridItem(.flexible()),
    ]
    
    var body: some View {
        LazyVGrid(columns: columns,  spacing: 15) {
            ForEach(0..<topicData.count) { index in
                NavigationLink(destination: Text("고민 상세 페이지")) {
                    VStack {
                        SearchTopicItem(topic: topicData[index])
                        
                        if index < (topicData.count - 1) {
                            Divider()
                        }
                    }
                }
            }
        }
        
    }
}

struct SearchTopicList_Previews: PreviewProvider {
    static var previews: some View {
        SearchTopicList()
    }
}
