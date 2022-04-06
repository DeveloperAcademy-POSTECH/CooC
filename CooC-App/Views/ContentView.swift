//
//  ContentView.swift
//  CooC-App
//
//  Created by peo on 2022/04/05.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .Home
    
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
            
            TopicSeriesView()
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
