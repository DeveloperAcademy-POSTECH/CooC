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
    
    @EnvironmentObject var homeViewState: HomeViewState
    @EnvironmentObject var searchViewState: SearchViewState
    
    init() {
        // 바운스 활성 시 스크롤 에니메이션 에러가 발생합니다.
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                ScrollView {
                    VStack {
                        TopicListTitle(title: "🔥Popular Topics🔥")
                            .padding(.horizontal, horizontalDefaultPadding)
                            .padding(.top, 140)
                        TopicList(index: $homeViewState.popularTopicIndex, items: $homeViewState.topicLists, itemKind: 0, isOn: $homeViewState.popularTopicIsOn)
                            .padding(.top, 6)
                            .padding(.bottom, 25)
                            
                        TopicListTitle(title: "⏰The Most Recent Topics⏰")
                            .padding(.horizontal, horizontalDefaultPadding)
                        TopicList(index: $homeViewState.recentTopicIndex, items: $homeViewState.topicLists, itemKind: 1, isOn: $homeViewState.recentTopicIsOn)
                            .padding(.top, 6)
                    }
                    .offset(y: hideNavigationBar ? -60 : 20)
                    // 스크롤 에니메이션
                    .overlay(
                        GeometryReader { proxy -> Color in
                            let minY = proxy.frame(in: .named("SCROLL")).minY
                            DispatchQueue.main.async {
                                // 내릴경우
                                if minY < offset {
                                    if offset < 0 && -minY > lastOffset {
                                        withAnimation(.easeOut.speed(1.5)) {
                                                hideNavigationBar = true
                                        }
                                        lastOffset = -offset
                                    }
                                }
                                // 올릴경우
                                if minY > offset  && -minY < lastOffset {
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
            .onAppear {
                searchViewState.currentSearchText = ""
            }
        }
        .padding(.top, 1)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
//        HomeView()
        Text("")
    }
}
