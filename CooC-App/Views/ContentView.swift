//
//  ContentView.swift
//  CooC-App
//
//  Created by peo on 2022/04/05.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .Home
    @EnvironmentObject var homeViewState: HomeViewState
    
    enum Tab {
        case Home
        case LookAround
        case MyPage
    }
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(Tab.Home)
            
            LookAroundView()
                .tabItem {
                    Label("Look Around", systemImage: "face.smiling.fill")
                }
                .tag(Tab.LookAround)
            
            MyPageView()
                .tabItem {
                    Label("My Page", systemImage: "person.fill")
                }
                .tag(Tab.MyPage)
        }
        .accentColor(.orange)
        .onAppear {
            homeViewState.popularTopicIsOn[0] = true
            homeViewState.recentTopicIsOn[0] = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
