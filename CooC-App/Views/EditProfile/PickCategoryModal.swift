//
//  PickCategoryModal.swift
//  CooC-App
//
//  Created by Youngseo Yoon on 2022/04/08.
//

import SwiftUI


struct PickCategoryModal: View {
    @Binding var checked: Bool

    
    var body: some View {
        List {
            ForEach(categoryData) { filter in
                CardView(filter: filter)
                
            }
            
        }.listStyle(PlainListStyle())
    }

}

struct CardView: View {
    @State var filter: Category
    
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .stroke(filter.checked ? ColorManager.mainOrange : Color.gray, lineWidth: 1)
                    .frame(width: 20, height: 20)
                
                if filter.checked {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 20))
                        .foregroundColor(ColorManager.mainOrange)
                }
            }

            Text(filter.title)
                .padding(4)
                .foregroundColor(ColorManager.mainOrange)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(color: .gray, radius: 2, x: 0, y: 2))
        }
        .onTapGesture(perform: {
            filter.checked.toggle()
        })
    }
}




struct PickCategory_Previews: PreviewProvider {
    struct PickCategoryHolder: View {
        @State var checked = false

        var body: some View {
            PickCategoryModal(checked: $checked)
        }
    }

    static var previews: some View {
        PickCategoryHolder()
    }
}
