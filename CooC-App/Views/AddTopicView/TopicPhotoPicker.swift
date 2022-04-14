//
//  TopicPhotoPicker.swift
//  CooC-App
//
//  Created by JungHoonPark on 2022/04/14.
//

import SwiftUI

struct TopicPhotoPicker : UIViewControllerRepresentable {
    
    // @Binding var avatarImage: UIImage
//    @EnvironmentObject var imagePicker : ImagePicker
    @EnvironmentObject var imagePicker : UserProfileData
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(topicPhotoPicker: self)
    }

    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let topicPhotoPicker: TopicPhotoPicker
        
        init(topicPhotoPicker: TopicPhotoPicker){
            self.topicPhotoPicker = topicPhotoPicker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage{
//                guard let data = image.jpegData(compressionQuality: 0.1), let compressedImage = UIImage(data:data) else {return}
                topicPhotoPicker.imagePicker.avatarImage = image
            } else {
                // return an error show an alert
                
            }
            picker.dismiss(animated: true)
        }
    }
}
