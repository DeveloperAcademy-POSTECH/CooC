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
    @Published var profilePicture = UIImage(named: "profileImageDefault")
}

