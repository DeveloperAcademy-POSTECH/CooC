//
//  profileObservable.swift
//  CooC-App
//
//  Created by 이영준 on 2022/04/11.
//

import Foundation
import SwiftUI

final class UserProfileData: ObservableObject{
    @Published var profileName: String = "Jun"
    @Published var profileIntroduce: String = "반갑습니다"
    @Published var profileEmail: String = "oldman45@gmail.com"
    @Published var profilePicture : UIImage = UIImage(named: "profileImageDefault")!
    @Published var isChecked : [Bool] = [false, true, false, false, true, false, false, false, false]
    @Published var isCountChecked : Int = 2
}

