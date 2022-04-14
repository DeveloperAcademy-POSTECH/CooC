//
//  ModalUserImageView.swift
//  CooC-App
//
//  Created by JungHoonPark on 2022/04/12.
//

import SwiftUI

struct ModalUserImageView: View {
    
    @State private var isShowingPhotoPicker = false
    // @State private var avatarImage = UIImage(systemName: "camera.fill")!
    
    @EnvironmentObject var imagePicker : UserProfileData
    
    var body: some View {
        VStack(){
            Image(uiImage: imagePicker.avatarImage)
//                .imageScale(.large)
                .resizable()
                .frame(width:128, height: 128)
                .foregroundColor(ColorManager.mainOrange)
                .background(Color.white)                  
                .cornerRadius(10)
                .padding(EdgeInsets(top: 18, leading: 20, bottom: 5, trailing: 0))
                .onTapGesture {
                   isShowingPhotoPicker = true
                }
        }
        .sheet(isPresented: $isShowingPhotoPicker, content: {TopicPhotoPicker()})
    }
}

struct ModalUserImageView_Previews: PreviewProvider {
    static var previews: some View {
        ModalUserImageView()
    }
}
