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
            ForEach(0..<categoryData.count) { row in
                HStack{
                    Image(systemName: checked ? "checkmark.square.fill" : "square")
                        .foregroundColor(checked ? ColorManager.mainOrange : ColorManager.mainOrange)
                        .onTapGesture {
                            self.checked.toggle()
                        }
                    Text(categoryData[row].title)
                        .padding(4)
                        .foregroundColor(ColorManager.mainOrange)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(color: .gray, radius: 2, x: 0, y: 2))
                }
                
                
            }
//            }
            
//                        HStack {
//                            Image(systemName: checked ? "checkmark.square.fill" : "square")
//                    .foregroundColor(checked ? ColorManager.mainOrange : ColorManager.mainOrange)
//                    .onTapGesture {
//                        self.checked.toggle()
//                    }
//
//                ZStack{
//                    Text("Life")
//                        .padding(3)
//                        .foregroundColor(ColorManager.mainOrange)
//                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(color: .gray, radius: 2, x: 0, y: 2))
//                }
//            }
            
            
        }.listStyle(PlainListStyle())
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
