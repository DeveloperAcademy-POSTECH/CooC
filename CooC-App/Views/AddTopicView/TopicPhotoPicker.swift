//
//  PhotoPicker.swift
//  CooC-App
//
//  Created by JungHoonPark on 2022/04/12.
//

import SwiftUI

struct  : UIViewControllerRepresentable {
    // @Binding var avatarImage: UIImage
    @EnvironmentObject var imagePicker : ImagePicker
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(photoPicker: self)
    }

    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let photoPicker: PhotoPicker
        
        init(photoPicker: PhotoPicker){
            self.photoPicker = photoPicker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage{
//                guard let data = image.jpegData(compressionQuality: 0.1), let compressedImage = UIImage(data:data) else {return}
                photoPicker.imagePicker.avatarImage = image
            } else {
                // return an error show an alert
                
            }
            picker.dismiss(animated: true)
        }
    }
}
