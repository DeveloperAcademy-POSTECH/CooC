//
//  ImagePicker.swift
//  CooC-App
//
//  Created by JungHoonPark on 2022/04/12.
//

import Foundation
import SwiftUI

final class ImagePicker: ObservableObject{
    @Published var avatarImage: UIImage = UIImage(named: "default-upload")!
}
