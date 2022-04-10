//
//  HomeViewState.swift
//  CooC-App
//
//  Created by peo on 2022/04/10.
//

import Foundation

final class HomeViewState: ObservableObject {
    @Published var popularTopicIndex: Int = 0
    @Published var recentTopicIndex: Int = 0
    
    @Published var popularTopicIsOn: [Bool] = [Bool](repeating: false, count: topicData.count)
    @Published var recentTopicIsOn: [Bool] = [Bool](repeating: false, count: topicData.count)
    
    @Published var categoryIndex: Int = 0
    
    
    @Published var currentIndices: [Int] = [0, 0]
}
