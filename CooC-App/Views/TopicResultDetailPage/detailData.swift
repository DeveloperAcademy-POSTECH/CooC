///
//  detailData.swift
//  CooC-App
//
//  Created by Hyeongjung on 2022/04/11.
//

import Foundation
import SwiftUI

struct Detail : Identifiable{
    let id = UUID()
    var name: String
    var title: String
    var category: String
    var progress: String
    var date: String
    var detail: String
    var etc: [String]
    var vote_list: [String]
    var vote:[Float]
}

let detailData : [Detail] = [
    Detail(name: "T.O.P", title: "오늘 뭐 먹지",category:"Food", progress:"진행중", date:"2022.04.09",
           detail:"너무 배가 고픈데 오늘은 뭐 먹을까요? 추천해주세요 추천해주세요 추천해주세요 추천해주세요",
           etc:["불고기 전골!!","아무거나 먹으세요","난 모르겠다"],vote_list:["돈까스","치킨"], vote: [150,100]),
    Detail(name: "T.O.P", title: "무슨 게임할까",category:"Game", progress:"진행중", date:"2022.03.29",
           detail:"스트레스 해소용 게임 추천해주세요",
           etc:["아무거나 하세요","난 모르겠다~"],vote_list:["서든어택","오버워치","롤"],vote: [200,100,400]),
    Detail(name: "T.O.P", title: "드라마 뭐가 재밌지",category:"Movie", progress:"진행중", date:"2022.02.13",
           detail:"너무 배가 고픈데 오늘은 뭐 먹을까요? 추천해주세요",
           etc:["불고기 전골!!","넷플릭스"],vote_list:["파친코","너의 목소리가 들려"],vote: [200,150]),
    Detail(name: "T.O.P", title: "과일 뭐 먹을까",category:"Food", progress:"진행중", date:"2022.01.11",
           detail:"후식용 과일 추천해주세요",
           etc:["아무거나 먹어"],vote_list:["사과","배"],vote: [200,100]),
    Detail(name: "T.O.P", title: "오늘 룩 어떄?",category:"Fashion", progress:"진행중", date:"2022.04.05",
           detail:"너무 배가 고픈데 오늘은 뭐 입을까요? 추천해주세요",
           etc:["둘다 별로"],vote_list:["반바지","긴바지"],vote: [200,100]),
    Detail(name: "T.O.P", title: "핸드폰 살까?",category:"Life", progress:"진행중", date:"2022.02.12",
           detail:"둘다 사고싶은데 추천해주세요",
           etc:["불고기 전골!!","블랙베리"],vote_list:["아이폰","갤럭시"],vote: [200,100]),
    Detail(name: "T.O.P", title: "앞으로 뭐 해먹고 살까?",category:"Life", progress:"진행중", date:"2022.01.30",
           detail:"무슨 직업이 뜰까요? 추천해주세요",
           etc:["월급쟁이 ㄱㄱ"],vote_list:["AI","치킨집"],vote: [200,100]),
    Detail(name: "T.O.P", title: "노래 추천해줘",category:"Life", progress:"진행중", date:"2022.01.01",
           detail:"오늘 날씨 좋은데 조깅할 예정입니다. 무슨 노래가 좋을까요?",
           etc:["일단 나가"],vote_list:["루시-조깅","한비-위켄더"],vote: [200,100]),
    Detail(name: "T.O.P", title: "저녁메뉴 추천 좀",category:"Food", progress:"진행중", date:"2021.12.15",
           detail:"너무 배가 고픈데 오늘은 뭐 먹을까요? 추천해주세요",
           etc:["치돈이 진리지"],vote_list:["돈까스","치킨"],vote: [200,100])
]

