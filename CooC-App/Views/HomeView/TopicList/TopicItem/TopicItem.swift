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
            ZStack(alignment: .bottomTrailing) {
                Image(topic.imageName)
                    .resizable()
                    .frame(width: 260, height: 260)
                    .cornerRadius(26)
                    .shadow(radius: 4)
                    .padding(.top)
                
                Button(action: {
                    // TODO: 장문형으로 보내기
                }) {
                    Image(systemName: "paperplane.circle.fill")
                        .resizable()
                        .frame(width: 35, height: 35)
                }
                .padding(10)
            }
            
            Text(topic.title)
                .font(.title3)
                .padding(.horizontal, 15)
                .padding(.top, 10)
            
            VStack(alignment: .leading, spacing: 15) {
                HStack(alignment: .center, spacing: 20) {
                    ChoiceButton(choiceText: topic.choices[0])
                    ChoiceButton(choiceText: topic.choices[1])
                }
                if topic.choices.count > 2 {
                    HStack(alignment: .center, spacing: 20) {
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
}

struct TopicItem_Previews: PreviewProvider {
    static var previews: some View {
        TopicItem(topic: Topic(imageName: "icybay", title: "저녁 메뉴 추천좀 해주세요", choices: ["돈까스", "치킨", "불고기"]))
    }
}
