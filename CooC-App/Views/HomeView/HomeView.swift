//
//  MainView.swift
//  CooC-App
//
//  Created by peo on 2022/04/05.
//

import SwiftUI

struct HomeView: View {
    @State var hideNavigationBar = false
    @State var offset: CGFloat = 0
    @State var lastOffset: CGFloat = 0
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                ScrollView {
                        VStack {
                            TopicListTitle(title: "🔥Popular Topics🔥")
                                .padding(.horizontal, 15)
                                .padding(.top, 155)
                            TopicList()
                                .padding(.top, 6)
                                .padding(.bottom, 35)
                            
                            TopicListTitle(title: "⏰The Most Recent Topics⏰")
                                .padding(.horizontal, 15)
                            TopicList()
                                .padding(.top, 6)
                                .padding(.bottom, 35)
                        }
                        .overlay(
                            GeometryReader { proxy -> Color in
                                let minY = proxy.frame(in: .named("SCROLL")).minY
                                DispatchQueue.main.async {
                                    let durationOffset: CGFloat = 50
                                    
                                    if minY < offset {
                                        if offset < 0 && -minY > (lastOffset + durationOffset) {
                                            withAnimation(.easeOut.speed(1.5)) {
                                                 hideNavigationBar = true
                                            }
                                            lastOffset = -offset
                                        }
                                    }
                                    if minY > offset && -minY < (lastOffset - durationOffset){
                                        withAnimation(.easeOut.speed(1.5)) {
                                             hideNavigationBar = false
                                        }
                                        lastOffset = -offset
                                    }
                                    
                                    self.offset = minY
                                }
                                return Color.clear
                            }
                        )
                        
                    }
                .coordinateSpace(name: "SCROLL")
                
                CustomNavigationBar()
                    .offset(y: hideNavigationBar ? -150 : -10)
            }
            .navigationBarHidden(true)
            }
        .padding(.top, 1)
        }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
