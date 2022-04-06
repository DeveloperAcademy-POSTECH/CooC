//
//  MainView.swift
//  CooC-App
//
//  Created by peo on 2022/04/05.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            ScrollView {
                TopicListTitle(title: "🔥Popular Topics🔥")
                    .padding(.horizontal, 15)
                TopicList()
                    .padding(.bottom, 35)
                
                TopicListTitle(title: "⏰The Most Recent Topics⏰")
                    .padding(.horizontal, 15)
                TopicList()
                    .padding(.bottom, 35)
            }
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
