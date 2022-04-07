//
//  TopicStructure.swift
//  CooC-App
//
//  Created by peo on 2022/04/06.
//

import Foundation

struct Topic {
    var image: String
    var title: String
    var contents: String
    var choices: [String]
    var category: String
    var isEnd: Bool
    var answerNumber: Int
}

let topicData: [Topic] = [
    Topic(image: "chincoteague", title: "너무 더워요", contents: "여름 너무 싫어요", choices: [], category: "Life", isEnd: true, answerNumber: 4),
    Topic(image: "lakemcdonald", title: "더벅머리 어떤가요", contents: "방금 샵 갔다옴", choices: [], category: "Fashion", isEnd: false, answerNumber: 6),
    Topic(image: "umbagog", title: "더러운 옷 빨래하는법", contents: "이거 꿀팁임", choices: [], category: "Life", isEnd: false, answerNumber: 41),
    Topic(image: "stmarylake", title: "더 배트맨 재밌나요", contents: "재밌나용", choices: [], category: "Movie", isEnd: true, answerNumber: 2),
    Topic(image: "twinlake", title: "여행지 추천 받아요", contents: "어디든 놀러가고 싶어요", choices: ["해운대", "설악산"], category: "Travel", isEnd: true, answerNumber: 9),
    Topic(image: "icybay", title: "저녁 메뉴 추천좀 해주세요", contents: "배가 너무 고픔", choices: ["돈까스", "치킨", "불고기"], category: "Food", isEnd: true, answerNumber: 9),
    Topic(image: "umbagog", title: "요즘 게임 뭐가 핫함?", contents: "아 할거없다", choices: ["롤", "피파", "앨든링"], category: "Game", isEnd: false, answerNumber: 7),
    Topic(image: "hiddenlake", title: "소개팅 나가는데, 의상 함 봐주세요", contents: "두근두근", choices: ["굳", "우엑"], category: "Life", isEnd: true, answerNumber: 25),
]
