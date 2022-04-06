//
//  FilterButtonList.swift
//  CooC-App
//
//  Created by peo on 2022/04/06.
//

import SwiftUI

struct FilterButtonList: View {
    private var categoryText = ["All", "Fashion", "Food", "Travel", "Electronics", "Book"]
    @State var index = 0
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center) {
                ForEach(0..<categoryText.count) { index in
                    Text(categoryText[index])
                        .padding(.vertical, 5)
                        .frame(width: 85, height: 30)
                        .foregroundColor(self.index == index ? .white : .black)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(self.index == index ? .orange : .white)
                                .frame(width: 85, height: 30)
                                .shadow(radius: 1)
                        )
                        .onTapGesture {
                            self.index = index
                        }
                        .padding(.trailing, index == (categoryText.count - 1) ? 15 : 5)
                }
            }
            .padding(.vertical, 5)
            .padding(.leading, 15)
        }
    }
}

struct FilterButtonList_Previews: PreviewProvider {
    static var previews: some View {
//        FilterButtonList()
        Text("")
    }
}
