//
//  TopicStructure.swift
//  CooC-App
//
//  Created by peo on 2022/04/06.
//

import Foundation
import Combine

struct Topic : Identifiable, Equatable {
    var id = UUID()
    var image: String
    var title: String
    var contents: String
    var choices: [String]
    var category: String
    var isEnd: Bool
    var answerNumber: Int
    var choicePercentages: [Int]
    var isSubmitted = false
}

var categoryText = ["All", "Fashion", "Food", "Travel", "Game", "Movie", "Life"]

let topicData: [Topic] = [
    Topic(image: "chincoteague", title: "너무 더워요", contents: "여름 너무 싫어요", choices: ["인정", "참아"], category: "Life", isEnd: true, answerNumber: 4, choicePercentages: [16, 84]),
    Topic(image: "lakemcdonald", title: "더벅머리 어떤가요", contents: "방금 샵 갔다옴", choices: ["으악", "괜찮음", "이쁨", "나한테 오셈"], category: "Fashion", isEnd: false, answerNumber: 6, choicePercentages: [58, 14, 26, 2]),
    Topic(image: "umbagog", title: "더러운 옷 빨래하는법", contents: "이거 꿀팁임", choices: ["인정", "별루"], category: "Life", isEnd: false, answerNumber: 41, choicePercentages: [52, 48]),
    Topic(image: "stmarylake", title: "더 배트맨 재밌나요", contents: "재밌나용", choices: ["보지마", "꿀잼", "또 봐야함"], category: "Movie", isEnd: true, answerNumber: 2, choicePercentages: [10, 48, 42]),
    Topic(image: "twinlake", title: "여행지 추천 받아요", contents: "어디든 놀러가고 싶어요", choices: ["해운대", "설악산"], category: "Travel", isEnd: true, answerNumber: 9, choicePercentages: [50, 50]),
    Topic(image: "icybay", title: "저녁 메뉴 추천좀 해주세요", contents: "배가 너무 고픔", choices: ["돈까스", "치킨", "불고기"], category: "Food", isEnd: true, answerNumber: 9, choicePercentages: [29, 10, 61]),
    Topic(image: "umbagog", title: "요즘 게임 뭐가 핫함?", contents: "아 할거없다", choices: ["롤", "피파", "앨든링"], category: "Game", isEnd: false, answerNumber: 7, choicePercentages: [20, 70, 10]),
    Topic(image: "hiddenlake", title: "소개팅 나가는데, 의상 함 봐주세요", contents: "이번에 잘 보이고 싶네요ㅎㅎ 아 너무 두근되는데 어떡하지 하 너무 떨려 후후ㅜ훟후", choices: ["굳", "우엑"], category: "Life", isEnd: true, answerNumber: 25, choicePercentages: [11, 89]),
]

let topicData2: [Topic] = [
    Topic(image: "chincoteague", title: "진로 뭐할까?", contents: "곧 졸업인데 뭐하지", choices: ["iOS", "Android", "Web"], category: "Life", isEnd: true, answerNumber: 4, choicePercentages: [11, 50, 39]),
    Topic(image: "lakemcdonald", title: "나이키 신발 이쁘지", contents: "어때?어때?", choices: ["괜찮음", "이쁨"], category: "Fashion", isEnd: false, answerNumber: 6, choicePercentages: [58, 42]),
    Topic(image: "umbagog", title: "데이트 어디로 갈까", contents: "참고로 남자 둘이서 감", choices: ["국밥집", "쿠우쿠우"], category: "Life", isEnd: false, answerNumber: 41, choicePercentages: [98, 2]),
    Topic(image: "stmarylake", title: "둘 중 어떤게 나아요", contents: "소개팅 두근두근", choices: ["깔끔", "이쁨"], category: "Fashion", isEnd: true, answerNumber: 2, choicePercentages: [70, 30]),
    Topic(image: "stmarylake", title: "여사친 생일 선물 추천", contents: "그런 사이 아니에요", choices: ["향수", "옷"], category: "Life", isEnd: true, answerNumber: 2, choicePercentages: [57, 43]),
    Topic(image: "stmarylake", title: "영화 뭐 볼까", contents: "집에서 혼자 볼꺼임", choices: ["소셜 네트워크", "빅쇼트"], category: "Movie", isEnd: true, answerNumber: 2, choicePercentages: [58, 42]),
]
