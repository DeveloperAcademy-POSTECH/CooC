//
//  TopicItem.swift
//  CooC-App
//
//  Created by peo on 2022/04/06.
//

import SwiftUI

struct TopicItem: View {
    @Binding var topic: Topic
    @Binding var isOn: Bool
    @EnvironmentObject var homeViewState: HomeViewState
    var itemKind: Int
    
    var body: some View {
        VStack(spacing: 5) {
            Text(topic.title)
                .font(.title3)
                .fontWeight(.bold)
                .lineLimit(2)
            
            ZStack(alignment: .bottom) {
                Image(topic.image)
                    .resizable()
                    .frame(width: isOn ? 255 : 200, height: isOn ? 255 : 200)
                    .cornerRadius(imageRadius)
                    .shadow(radius: 4)
                
                if isOn {
                    Text("Submitted")
                        .bold()
                        .frame(width: topic.isSubmitted ? 255 : 0, height: topic.isSubmitted ? 255 : 0)
                            .background(.ultraThinMaterial)
                        .cornerRadius(imageRadius)
                } else {
                    Text(topic.isSubmitted ? "Submitted" : "")
                        .bold()
                        .frame(width: topic.isSubmitted ? 200 : 0, height: topic.isSubmitted ? 200 : 0)
                        .background(.ultraThinMaterial)
                        .cornerRadius(imageRadius)
                }
                
                // 카테고리 및 장문 보내기 아이콘
                HStack(alignment: .bottom) {
                    Text(topic.category)
                        .bold()
                        .frame(width: 70, height: 25)
                        .font(.caption)
                        .foregroundColor(.orange)
                        .background(.white)
                        .cornerRadius(categoryRadius)
                        .shadow(radius: 1)
                    
                    Spacer()
                    
                    Button(action: {
                        // TODO: 장문형으로 보내기
                    }) {
                        Image(systemName: "paperplane.circle.fill")
                            .resizable()
                            .frame(width: topic.isSubmitted ? 0 : 35, height: topic.isSubmitted ? 0 : 35)
                            .background(
                                Circle()
                                    .fill(.white)
                            )
                    }
                    .padding(10)
                }
                .frame(width: isOn ? 255 : 200)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                HStack(alignment: .center, spacing: 15) {
                    ChoiceButton(topicId: topic.id, text: topic.choices[0], percentage: topic.choicePercentages[0], isTapped: $topic.isSubmitted, isOn: $isOn, itemKind: self.itemKind)
                    ChoiceButton(topicId: topic.id, text: topic.choices[1], percentage: topic.choicePercentages[1], isTapped: $topic.isSubmitted, isOn: $isOn, itemKind: self.itemKind)
                }
                if topic.choices.count > 2 {
                    HStack(alignment: .center, spacing: 15) {
                        ChoiceButton(topicId: topic.id, text: topic.choices[2], percentage: topic.choicePercentages[2], isTapped: $topic.isSubmitted, isOn: $isOn, itemKind: self.itemKind)
                        if topic.choices.count == 4 {
                            ChoiceButton(topicId: topic.id, text: topic.choices[3], percentage: topic.choicePercentages[0], isTapped: $topic.isSubmitted, isOn: $isOn, itemKind: self.itemKind)
                        }
                    }
                }
            }
            .padding(.top, 5)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, horizontalDefaultPadding)
        .background(.white)
        .cornerRadius(cardRadius)
        .shadow(radius: 4)
    }
}

struct TopicItem_Previews: PreviewProvider {
    static var previews: some View {
//        TopicItem(topic: topicData[3])
        Text("")
    }
}
