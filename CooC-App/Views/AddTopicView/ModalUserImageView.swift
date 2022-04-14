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
                .foregroundColor(Color.orange )
                .background(Color.white)
            //                    .overlay(
            //                        RoundedRectangle(cornerRadius: 15)
            //                    )
                .cornerRadius(10)
                .padding()
                .onTapGesture {
                    print("tapped")
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
