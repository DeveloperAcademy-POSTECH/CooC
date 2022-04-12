//
//  PickCategoryModal.swift
//  CooC-App
//
//  Created by Youngseo Yoon on 2022/04/08.
//

import SwiftUI


struct PickCategoryModal: View {

    
    var body: some View {
        List {
//            ForEach(categoryData) { filter in
//                CardView(filter: $checkBox)
//
//            }
            CardView()
            
            
        }.listStyle(PlainListStyle())
    }

}

struct CardView: View {

    @State private var isChecked: [Bool] = [false, false, false, false, false, false, false, false, false]

    var body: some View {
        ForEach(0 ..< categoryData.count) { index in
            HStack {
                ZStack {
                    Circle()
                        .stroke(isChecked[index] ? ColorManager.mainOrange : Color.gray, lineWidth: 1)
                        .frame(width: 20, height: 20)
                    
                    if isChecked[index] {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 20))
                            .foregroundColor(ColorManager.mainOrange)
                    }
                }

                Text(categoryData[index].title)
                    .padding(4)
                    .foregroundColor(ColorManager.mainOrange)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(color: .gray, radius: 2, x: 0, y: 2))
            }
            .onTapGesture(perform: {
                isChecked[index].toggle()
                print("체크된 값 \(categoryData[index].title), \(isChecked[index])")
            })
        }
    }
}




struct PickCategory_Previews: PreviewProvider {
    struct PickCategoryHolder: View {
        @State var checkboxPop = false
        @State var checkbox = false
        var body: some View {
            PickCategoryModal()
        }
    }

    static var previews: some View {
        PickCategoryHolder()
    }
}
