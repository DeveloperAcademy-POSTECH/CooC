//
//  CategoryModel.swift
//  CooC-App
//
//  Created by Youngseo Yoon on 2022/04/09.
//

import Foundation


struct Category: Identifiable {
    var id = UUID().uuidString
    let title: String
    var checked: Bool
}

var categoryData = [
    
    Category(title: "Animals", checked: false),
    Category(title: "Book", checked: false),
    Category(title: "Electronics", checked: false),
    Category(title: "Fashion", checked: false),
    Category(title: "Food", checked: false),
    Category(title: "Life", checked: false),
    Category(title: "Travel", checked: false),
    Category(title: "Tools", checked: false),
    Category(title: "WorkOut", checked: false)
]


