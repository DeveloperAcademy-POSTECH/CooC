//
//  detailData.swift
//  CooC-App
//
//  Created by Hyeongjung on 2022/04/11.
//

import Foundation
import SwiftUI

struct Detail {
    var id: Int
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
    Detail(id: 1001, name: "T.O.P", title: "일이삼사오육칠팔",category:"Food", progress:"진행중", date:"2022.04.04",
           detail:"너무 배가 고픈데 오늘은 뭐 먹을까요? 추천해주세요 추천해주세요 추천해주세요 추천해주세요",
           etc:["불고기 전골!!"],vote_list:["돈까스","치킨"], vote: [200,100]),
    Detail(id: 1002, name: "T.O.P", title: "안녕하세요",category:"Food", progress:"진행중", date:"2022.04.04",
           detail:"너무 배가 고픈데 오늘은 뭐 먹을까요? 추천해주세요",
           etc:["불고기 전골!!"],vote_list:["돈까스","치킨"],vote: [200,100]),
    Detail(id: 1003, name: "T.O.P", title: "반갑습니다",category:"Food", progress:"진행중", date:"2022.04.04",
           detail:"너무 배가 고픈데 오늘은 뭐 먹을까요? 추천해주세요",
           etc:["불고기 전골!!"],vote_list:["돈까스","치킨"],vote: [200,100])
]
