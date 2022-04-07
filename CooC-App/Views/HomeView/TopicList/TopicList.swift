//
//  TopicList.swift
//  CooC-App
//
//  Created by peo on 2022/04/06.
//

import SwiftUI

struct TopicList: View {
    
    var topicList: [Topic] = [
        Topic(imageName: "twinlake", title: "여행지 추천 받아요", choices: ["해운대", "설악산"]),
        Topic(imageName: "icybay", title: "저녁 메뉴 추천좀 해주세요", choices: ["돈까스", "치킨", "불고기"]),
        Topic(imageName: "umbagog", title: "요즘 게임 뭐가 핫함?", choices: ["롤", "피파", "앨든링"]),
        Topic(imageName: "hiddenlake", title: "소개팅 나가는데, 의상 함 봐주세요", choices: ["굳", "우엑"]),
    ]
    
    var body: some View {
        TopicItem(topic: topicList[0])
    }
}

struct TopicList_Previews: PreviewProvider {
    static var previews: some View {
        TopicList()
    }
}

