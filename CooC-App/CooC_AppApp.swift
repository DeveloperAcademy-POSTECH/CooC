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
    @StateObject private var homeViewState = HomeViewState()
    @StateObject private var searchViewState = SearchViewState()
    
    var body: some Scene {
        WindowGroup {
            TopicResultDetailPage()
//            ContentView()
            ContentView()
                .environmentObject(userProfileData)
                .environmentObject(homeViewState)
                .environmentObject(searchViewState)
        }
    }
}
