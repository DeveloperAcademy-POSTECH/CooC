//
//  ChoiceButton.swift
//  CooC-App
//
//  Created by peo on 2022/04/06.
//

import SwiftUI

struct ChoiceButton: View {
    var text: String
    var percentage: Int
    @Binding var isTapped: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: buttonRadius)
                .fill(.orange)
                .frame(width: isTapped ? (1.3 * CGFloat(percentage)) : 0, height: 40)
            
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
            .frame(width: 130, height: 40)
        }
        .background(
            RoundedRectangle(cornerRadius: buttonRadius)
                .fill(.white)
                .frame(width: 130, height: 40)
                .shadow(radius: 2)
        )
        .onTapGesture {
            withAnimation {
                isTapped = true
            }
        }
    }
}

struct ChoiceButton_Previews: PreviewProvider {
    static var previews: some View {
//        ChoiceButton(text: "", percentage: 50)
        Text("")
    }
}
