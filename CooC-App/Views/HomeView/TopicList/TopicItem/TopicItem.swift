//
//  TopicItem.swift
//  CooC-App
//
//  Created by peo on 2022/04/06.
//

import SwiftUI

struct TopicItem: View {
    var topic: Topic
    
    
    var body: some View {
        VStack {
            Text(topic.title)
                .font(.title3)
                .fontWeight(.bold)
                .padding(.top, 5)
            
            VStack {
                ZStack(alignment: .bottom) {
                    Image(topic.image)
                        .resizable()
                        .frame(width: 275, height: 275)
                        .cornerRadius(imageRadius)
                        .shadow(radius: 4)
                    
                    // 카테고리 및 장문 보내기 아이콘
                    HStack(alignment: .bottom) {
                        Text(topic.category)
                            .bold()
                            .frame(width: 70, height: 25)
                            .font(.caption)
                            .foregroundColor(.orange)
                            .background(
                                RoundedRectangle(cornerRadius: categoryRadius)
                                    .fill(.white)
                                    .shadow(radius: 1)
                            )
                        
                        Spacer()
                        
                        Button(action: {
                            // TODO: 장문형으로 보내기
                        }) {
                            Image(systemName: "paperplane.circle.fill")
                                .resizable()
                                .frame(width: 35, height: 35)
                        }
                        .padding(10)
                    }
                    .frame(width: 275)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack(alignment: .center, spacing: 15) {
                        ChoiceButton(choiceText: topic.choices[0])
                        ChoiceButton(choiceText: topic.choices[1])
                    }
                    if topic.choices.count > 2 {
                        HStack(alignment: .center, spacing: 5) {
                            ChoiceButton(choiceText: topic.choices[2])
                            if topic.choices.count == 4 {
                                ChoiceButton(choiceText: topic.choices[3])
                            }
                        }
                    }
                }
                .padding(.top, 5)
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, horizontalDefaultPadding)
        .background(
            RoundedRectangle(cornerRadius: cardRadius)
                .fill(.white)
                .shadow(radius: 4)
        )
    }
}

struct TopicItem_Previews: PreviewProvider {
    static var previews: some View {
        Text("")
    }
}
