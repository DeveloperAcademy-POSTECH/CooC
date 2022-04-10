//
//  TopicList.swift
//  CooC-App
//
//  Created by peo on 2022/04/06.
//

import SwiftUI

struct TopicList: View {
    @Binding var list: [Topic]
    var spacing: CGFloat
    var trailingSpace: CGFloat
    @Binding var index: Int
    
    init(spacing: CGFloat = 20, trailingSpace: CGFloat = 100, index: Binding<Int>, items: Binding<[Topic]>, itemKind: Int, isOn: Binding<[Bool]>) {
        self._list = items
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
        self.itemKind = itemKind
        self._isOn = isOn
    }
    
    @GestureState var offset: CGFloat = 0
    @EnvironmentObject var homeViewState: HomeViewState
    
    var itemKind: Int
    
    @Binding var isOn: [Bool]
    
    // 현재 토픽을 제외한 나머지 토픽의 크기를 줄입니다.
    public func update(index: Int) {
        withAnimation {
            isOn[index] = true
            if index > 0 {
                isOn[index - 1] = false
            }
            if index < (list.count - 1) {
                isOn[index + 1] = false
            }
        }
    }
    
    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width - (trailingSpace - spacing)
            let adjustMentWidth = (trailingSpace / 2) - spacing
            
            HStack(spacing: spacing) {
                ForEach(list.indices, id: \.self) { currentListIndex in
                    TopicItem(topic: $list[currentListIndex], isOn: $isOn[currentListIndex])
                        .padding(.leading, homeViewState.currentIndices[itemKind] == 0 ? (UIScreen.main.bounds.width - 280) / 2 : 0) // 첫 번째 토픽에만 왼쪽에 패딩값을 주어 가운데에 배치시킵니다.
                        .frame(width: (proxy.size.width - trailingSpace))
                }
            }
            .padding(.horizontal, spacing)
            .offset(x: (CGFloat(homeViewState.currentIndices[itemKind]) * -width) + (homeViewState.currentIndices[itemKind] != 0 ? adjustMentWidth : 0) + offset)
            .gesture(
                DragGesture()
                    .updating($offset, body: { value, out, _ in
                        out  = value.translation.width
                    })
                    .onEnded({value in
                        let offsetX = value.translation.width
                        
                        let progress = -offsetX / width
                        let roundIndex = progress.rounded()
                        
                        homeViewState.currentIndices[itemKind] = max(min(homeViewState.currentIndices[itemKind] + Int(roundIndex), list.count - 1), 0)
                        homeViewState.currentIndices[itemKind] = index
                        update(index: homeViewState.currentIndices[itemKind])
                    })
                    .onChanged({ value in
                        let offsetX = value.translation.width
                        
                        let progress = -offsetX / width
                        let roundIndex = progress.rounded()
                        
                        index = max(min(homeViewState.currentIndices[itemKind] + Int(roundIndex), list.count - 1), 0)
                        update(index: index)
                    })
            )
        }
        .frame(height: 370)
        .animation(.easeInOut, value: offset == 0)
    }
}

struct TopicList_Previews: PreviewProvider {
    static var previews: some View {
        Text("")
    }
}
