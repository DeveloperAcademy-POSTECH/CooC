//
//  ChoiceButton.swift
//  CooC-App
//
//  Created by peo on 2022/04/06.
//

import SwiftUI

struct ChoiceButton: View {
    var choiceText: String
    
    var body: some View {
        Button(action: {
            
        }) {
            Text(choiceText)
                .font(.subheadline)
                .foregroundColor(.black)
                .fontWeight(.bold)
                .frame(width: 130, height: 40)
                .lineLimit(2)
                .truncationMode(.tail)
                .background(
                    RoundedRectangle(cornerRadius: buttonRadius)
                        .fill(.white)
                        .frame(width: 130, height: 40)
                        .shadow(radius: 2)
                )
        }
    }
}

struct ChoiceButton_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceButton(choiceText: "")
    }
}
