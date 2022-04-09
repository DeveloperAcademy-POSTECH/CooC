//
//  SearchTopicItem.swift
//  CooC-App
//
//  Created by peo on 2022/04/07.
//

import SwiftUI

struct SearchTopicItem: View {
    var topic: Topic
    
    var body: some View {
        HStack {
            ZStack(alignment: .bottomLeading) {
                Image(topic.image)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(imageRadius)
                
                Text(topic.category)
                    .bold()
                    .frame(width: 48, height: 22)
                    .font(.caption2)
                    .foregroundColor(.orange)
                    .padding(.horizontal, 3)
                    .background(.white)
                    .cornerRadius(categoryRadius)
                    .shadow(radius: 1)
            }
            
            VStack(alignment: .leading) {
                Text(topic.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .lineLimit(2)
                    .padding(.top, 5)
                    .padding(.bottom, 1)
                    .multilineTextAlignment(.leading)
                
                Text(topic.contents)
                    .font(.subheadline)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Text(topic.isEnd ? "마감" : "진행중")
                        .font(.caption)
                        .bold()
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .foregroundColor(topic.isEnd ? .white : .black)
                        .background(topic.isEnd ? .orange : .white)
                        .cornerRadius(buttonRadius)
                        .shadow(radius: 1)
                    
                    Image(systemName: "person.2.fill")
                    Text("\(topic.answerNumber)")
                        .frame(width: 20)
                }
            }
            .foregroundColor(.black)
            .padding(.leading, 10)
        }
    }
}

struct SearchTopicItem_Previews: PreviewProvider {
    static var previews: some View {
        Text("")
    }
}
