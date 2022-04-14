//
//  ProfileExample.swift
//  CooC-App
//
//  Created by 이영준 on 2022/04/09.
//

import Foundation
import SwiftUI

struct Profile {
    var name : String
    var introduce : String
    var category : [String]
}

struct StoryList : Identifiable{
    let title: String
    let detail: String
    let date: String
    let id = UUID()
}

let profileData : [Profile] = [
    Profile(name: "DPark", introduce: "Im DPark", category: ["Coffee", "Alcohol"]),
    Profile(name: "Zero", introduce: "Im Zero", category: ["Alcohol", "Menu"]),
    Profile(name: "Ben", introduce: "Im Ben", category: ["Coffee", "Running"]),
    Profile(name: "Jun", introduce: "Im Jun", category: ["Alcohol", "Running"]),
    Profile(name: "Badger", introduce: "Im Badger", category: ["Study", "Menu"]),
    Profile(name: "Digi", introduce: "Im Digi", category: ["Singing", "Coffee"])
]

// \(profileData[0])의 질문 리스트라 가정
let storyListData: [[StoryList]] = [
    [
        StoryList(title: "오늘 뭐 먹지", detail: "돈까스? 카레?", date: "2022/04/09"),
        StoryList(title: "무슨 게임할까", detail: "롤? 배그?", date: "2022/03/29"),
        StoryList(title: "드라마 뭐가 재밌지", detail: "그해 우리는 재밌나요", date: "2022/02/13"),
        StoryList(title: "과일 뭐 먹을까", detail: "사과? 딸기?", date: "2022/01/11")
     ],
    [
        StoryList(title: "오늘 룩 어때?", detail: "괜찮아?", date: "2022/04/05"),
        StoryList(title: "핸드폰 살까?", detail: "갤럭시로?", date: "2022/02/12"),
        StoryList(title: "앞으로 뭐 해먹고 살까?", detail: "코딩?", date: "2022/01/30"),
        StoryList(title: "노래 추천해줘", detail: "발라드로", date: "2022/01/01"),
        StoryList(title: "저녁 메뉴 추천 좀", detail: "짜파게티? 라면?", date: "2021/12/15")
    ]
]

