//
//  CooC_AppApp.swift
//  CooC-App
//
//  Created by peo on 2022/04/05.
//

import SwiftUI

@main
struct CooC_AppApp: App {
    @StateObject private var userProfileData = UserProfileData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userProfileData)
        }
    }
}
