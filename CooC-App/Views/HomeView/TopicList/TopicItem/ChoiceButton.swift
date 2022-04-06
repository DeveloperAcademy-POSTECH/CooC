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
                .foregroundColor(.black)
                .frame(width: 150, height: 40)
                .padding(.horizontal, 5)
                .lineLimit(2)
                .truncationMode(.tail)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                        .frame(width: 150, height: 40)
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
