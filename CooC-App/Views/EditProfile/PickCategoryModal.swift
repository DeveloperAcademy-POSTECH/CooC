//
//  PickCategoryModal.swift
//  CooC-App
//
//  Created by Youngseo Yoon on 2022/04/08.
//

import SwiftUI


struct PickCategoryModal: View {
    @Binding var showCategoryModal: Bool
    @EnvironmentObject var userProfileData: UserProfileData
    @State var selectedCount = 0
    
    var body: some View {
        CategoryNavigationBar()
        List {
            ForEach(0 ..< categoryData.count) { index in
                HStack {
                    ZStack {
                        Circle()
                            .stroke(userProfileData.isChecked[index] ? ColorManager.mainOrange : Color.gray, lineWidth: 1)
                            .frame(width: 20, height: 20)
                        
                        if userProfileData.isChecked[index] {
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
                    userProfileData.isCountChecked += userProfileData.isChecked[index] ? 1 : -1
                    if userProfileData.isCountChecked > 2 {
                        userProfileData.isChecked[index] = false
                        userProfileData.isCountChecked -= 1
                    }
                    print(userProfileData.isCountChecked)
                })
            }
        }
        .listStyle(PlainListStyle())
        
        Text("Select maximum of 2 preference categories")
            .font(.subheadline)
            .foregroundColor(ColorManager.subCobaltBlue)
            .padding(.bottom, 30)
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
