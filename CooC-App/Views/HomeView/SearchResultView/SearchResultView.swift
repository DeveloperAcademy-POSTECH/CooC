//
//  SearchResultView.swift
//  CooC-App
//
//  Created by peo on 2022/04/07.
//

import SwiftUI

struct SearchResultView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var hideNavigationBar = false
    @State var offset: CGFloat = 0
    @State var lastOffset: CGFloat = 0
    var searchText = ""
    var topicList: [Topic]
    
    init(searchText: String) {
        self.searchText = searchText
        self.topicList = topicData.filter { topic in
            topic.title.contains(searchText) || topic.contents.contains(searchText)
        }
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Text("Search: \(searchText)")
                        .font(.title3)
                        .bold()
                    
                    SearchTopicList(topicList: self.topicList)
                }
                .padding(.top, 60)
                .padding(.horizontal, horizontalDefaultPadding)
                .padding(.bottom, 35)
                .overlay(
                    GeometryReader { proxy -> Color in
                        let minY = proxy.frame(in: .named("SCROLL")).minY
                        DispatchQueue.main.async {
                            if minY < offset {
                                if offset < 0 && -minY > lastOffset {
                                    withAnimation(.easeOut.speed(1.5)) {
                                         hideNavigationBar = true
                                    }
                                    lastOffset = -offset
                                }
                            }
                            
                            if minY > offset && -minY < lastOffset {
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
            
            // 네비게이션 바(뒤로 가기)
            HStack {
                Button(action: {
                    self.mode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .foregroundColor(.orange)
                        .frame(width: 13, height: 25)
                }
                .padding(.leading, horizontalDefaultPadding)
                Spacer()
            }
            .padding(.top, 15)
            .background(
                Rectangle()
                    .fill(.white)
                    .frame(width: .infinity, height: 65)
            )
            .offset(y: hideNavigationBar ? -65 : 0)
        }
        .navigationBarHidden(true)
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView(searchText: "가")
    }
}
