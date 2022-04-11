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
    
    @Published var topicLists: [Topic] = topicData
    func updateList() {
        topicLists = topicData.filter { topic in
            if !topic.isSubmitted {
                if self.categoryIndex == 0 {
                    return true
                } else {
                    return topic.category == categoryText[self.categoryIndex]
                }
            }
            return false
        }
    }
    func submit(id: UUID) {
        var index = 0
        while topicLists[index].id != id {
            index += 1
        }
        topicLists[index].isSubmitted = true
    }
}
