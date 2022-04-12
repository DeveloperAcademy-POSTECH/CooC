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
}

var categoryData = [
    Category(title: "Animals"),
    Category(title: "Book"),
    Category(title: "Electronics"),
    Category(title: "Fashion"),
    Category(title: "Food"),
    Category(title: "Life"),
    Category(title: "Travel"),
    Category(title: "Tools"),
    Category(title: "WorkOut")
]


