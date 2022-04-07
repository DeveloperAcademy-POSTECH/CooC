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
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack {
                    
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
            HStack {
                Button(action: {
                    self.mode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .foregroundColor(.orange)
                        .frame(width: 13, height: 25)
                }
                .padding(.leading, 15)
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
        SearchResultView()
    }
}
