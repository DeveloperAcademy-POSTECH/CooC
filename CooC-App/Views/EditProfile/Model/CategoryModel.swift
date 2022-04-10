//
//  CategoryModel.swift
//  CooC-App
//
//  Created by Youngseo Yoon on 2022/04/09.
//

import Foundation


struct Category: Hashable {
    let title: String
    var isChecked: Bool
}

let categoryData: [Category] = [
    
    Category(title: "Animals", isChecked: false),
    Category(title: "Book", isChecked: false),
    Category(title: "Electronics", isChecked: false),
    Category(title: "Fashion", isChecked: false),
    Category(title: "Food", isChecked: false),
    Category(title: "Life", isChecked: false),
    Category(title: "Travel", isChecked: false),
    Category(title: "Tools", isChecked: false),
    Category(title: "WorkOut", isChecked: false)
]


