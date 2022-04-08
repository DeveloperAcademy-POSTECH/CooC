//
//  TopicList.swift
//  CooC-App
//
//  Created by peo on 2022/04/06.
//

import SwiftUI

struct TopicList: View {
    var body: some View {
        TopicItem(topic: topicData[6])
    }
}

struct TopicList_Previews: PreviewProvider {
    static var previews: some View {
        TopicList()
    }
}

