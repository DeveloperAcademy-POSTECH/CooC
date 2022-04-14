//
//  PickCategoryModal.swift
//  CooC-App
//
//  Created by Youngseo Yoon on 2022/04/08.
//

import SwiftUI


struct PickCategoryModal: View {
    @Binding var showCategoryModal: Bool
//    @State private var isChecked: [Bool] = [false, false, false, false, false, false, false, false, false]
    @EnvironmentObject var userProfileData: UserProfileData
    
    var body: some View {
        CategoryNavigationBar()
        List {
            ForEach(0 ..< categoryData.count) { index in
                HStack {
                    ZStack {
                        Circle()
                            .stroke(userProfileData.isChecked[index] ? ColorManager.mainOrange : Color.gray, lineWidth: 1)
                            .frame(width: 20, height: 20)
                        
                        if userProfileData.isChecked[index]{
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
                    userProfileData.isChecked[index].toggle()
                })
            }
        }
        .listStyle(PlainListStyle())
    }
    
}



//
//
//struct PickCategory_Previews: PreviewProvider {
//
//    struct PickCategoryHolder: View {
//        @Binding var showCategoryModal: Bool
//
//        var body: some View {
//            PickCategoryModal(showCategoryModal: $showCategoryModal)
//        }
//    }
//
//    static var previews: some View {
////        @Binding var showCategoryModal: Bool
//
//        PickCategoryHolder(showCategoryModal: $showCategoryModal)
//    }
//}
