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
                    .cornerRadius(20)
                
                Text(topic.category)
                    .bold()
                    .frame(width: 45, height: 22)
                    .font(.caption2)
                    .foregroundColor(.orange)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.white)
                            .frame(width: 45, height: 22)
                            .shadow(radius: 1)
                    )
            }
            
            VStack(alignment: .leading) {
                Text(topic.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .lineLimit(2)
                    .padding(.top, 5)
                    .padding(.bottom, 1)
                
                Text(topic.contents)
                    .font(.subheadline)
                    .lineLimit(2)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Text(topic.isEnd ? "마감" : "진행중")
                        .font(.caption)
                        .bold()
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .foregroundColor(topic.isEnd ? .white : .black)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(topic.isEnd ? .orange : .white)
                                .shadow(radius: 1)
                        )
                    
                    Image(systemName: "person.2.fill")
                    Text("\(topic.answerNumber)")
                        .frame(width: 18)
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
