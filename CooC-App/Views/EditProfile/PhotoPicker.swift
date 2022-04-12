//
//  PhotoPicker.swift
//  CooC-App
//
//  Created by Youngseo Yoon on 2022/04/07.
//

import SwiftUI

struct PhotoPicker: UIViewControllerRepresentable {

    @EnvironmentObject var userProfileData: UserProfileData
//    @Binding var avatarImage: UIImage
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Update는 비워두고 필요시 채우기
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(photoPicker: self)
    }
    
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let photoPicker: PhotoPicker
        
        init(photoPicker: PhotoPicker) {
            self.photoPicker = photoPicker
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage {
                photoPicker.userProfileData.profilePicture = image
            } else {
                //사진이 아닌 비디오 등을 골랐을 때 error alert를 표시할건가?
            }
            
            picker.dismiss(animated: true)
        }
    }
}

