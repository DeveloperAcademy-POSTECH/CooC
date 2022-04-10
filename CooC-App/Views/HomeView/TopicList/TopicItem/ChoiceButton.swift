//
//  ChoiceButton.swift
//  CooC-App
//
//  Created by peo on 2022/04/06.
//

import SwiftUI

struct ChoiceButton: View {
    var topicId: UUID
    var text: String
    var percentage: Int
    @Binding var isTapped: Bool
    @Binding var isOn: Bool
    @EnvironmentObject var homeViewState: HomeViewState
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: buttonRadius)
                .fill(.orange)
                .frame(width: isTapped ? (1.2 * CGFloat(percentage)) : 0, height: isOn ? 30 : 25)
            
            HStack(spacing: 0) {
                Text(text)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .lineLimit(2)
                    .truncationMode(.tail)
                
                Text(isTapped ? "\(percentage) %" : "")
                    .font(.caption)
                    .foregroundColor(.black)
                    .padding(.leading, 3)
            }
            .frame(width: isOn ? 120 : 95, height: isOn ? 30 : 25)
        }
        .background(.white)
        .cornerRadius(buttonRadius)
        .shadow(radius: 2)
        .onTapGesture {
            withAnimation() {
                isTapped = true
                homeViewState.submit(id: topicId)
            }
        }
    }
}

struct ChoiceButton_Previews: PreviewProvider {
    static var previews: some View {
//        TopicList()
        Text("")
    }
}
