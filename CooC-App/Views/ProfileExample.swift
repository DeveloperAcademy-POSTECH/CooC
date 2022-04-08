//
//  ProfileExample.swift
//  CooC-App
//
//  Created by 이영준 on 2022/04/09.
//

import Foundation

struct Profile {
    var name : String
    var introduce : String
    var category : [String]
}

let profileData : [Profile] = [
    Profile(name: "DPark", introduce: "Im DPark", category: ["Coffee", "메뉴"]),
    Profile(name: "Zero", introduce: "Im Zero", category: ["Alcohol", "메뉴"]),
    Profile(name: "Ben", introduce: "Im Ben", category: ["Coffee", "Running"]),
    Profile(name: "Jun", introduce: "Im Jun", category: ["Alcohol", "Running"]),
    Profile(name: "Badger", introduce: "Im Badger", category: ["Study", "메뉴"]),
    Profile(name: "Digi", introduce: "Im Digi", category: ["Singing", "Coffee"])
]

