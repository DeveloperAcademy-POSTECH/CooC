//
//  FilterButtonList.swift
//  CooC-App
//
//  Created by peo on 2022/04/06.
//

import SwiftUI

struct FilterButtonList: View {
    @EnvironmentObject var homeViewState: HomeViewState
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center) {
                ForEach(categoryText.indices) { index in
                    Text(categoryText[index])
                        .padding(.vertical, 5)
                        .frame(width: 85, height: 30)
                        .font(.subheadline)
                        .foregroundColor(homeViewState.categoryIndex == index ? .white : .black)
                        .background(homeViewState.categoryIndex == index ? .orange : .white)
                        .cornerRadius(categoryRadius)
                        .shadow(radius: 1)
                        .onTapGesture {
                            homeViewState.categoryIndex = index
                            homeViewState.popularTopicIndex = 0
                            homeViewState.recentTopicIndex = 0
                            homeViewState.currentIndices = [0, 0]
                            homeViewState.updateList()
                            homeViewState.popularTopicIsOn = [Bool](repeating: false, count: homeViewState.topicLists.count)
                            homeViewState.popularTopicIsOn[0] = true
                            homeViewState.recentTopicIsOn = [Bool](repeating: false, count: homeViewState.topicLists2.count)
                            homeViewState.recentTopicIsOn[0] = true
                        }
                        .padding(.trailing, index == (categoryText.count - 1) ? horizontalDefaultPadding : 5)
                }
            }
            .padding(.vertical, 5)
            .padding(.leading, horizontalDefaultPadding)
        }
    }
}

struct FilterButtonList_Previews: PreviewProvider {
    static var previews: some View {
        Text("")
    }
}
