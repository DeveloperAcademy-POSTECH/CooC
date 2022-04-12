//
//  SearchViewState.swift
//  CooC-App
//
//  Created by peo on 2022/04/10.
//

import Foundation

final class SearchViewState: ObservableObject {
    @Published var recentSearchTexts = (UserDefaults.standard.array(forKey: "recentSearch") ?? []) as! [String]
    @Published var currentSearchText = ""
}
