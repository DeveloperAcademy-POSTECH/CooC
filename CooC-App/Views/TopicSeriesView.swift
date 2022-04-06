//
//  TopicSeriesView.swift
//  CooC-App
//
//  Created by Byeon jinha on 2022/04/06.
//

import SwiftUI

struct Post: Identifiable {
    var id = UUID().uuidString
    var postImage: String
}


struct SnapCarousel<Content: View, T: Identifiable> : View{
    var content: (T) -> Content
    var list: [T]
    
    
    var spacing: CGFloat
    var trailingSpace: CGFloat
    @Binding var index: Int
    
    init(spacing : CGFloat = 15, trailingSpace : CGFloat = 100, index : Binding<Int> , items:[T], @ViewBuilder content: @escaping (T)-> Content ){
        
        self.list = items
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
        self.content = content
    }
    @GestureState var offset: CGFloat = 0
    @State var currentIndex : Int = 0
    var body : some View{
        GeometryReader{proxy in
            let width = proxy.size.width - (trailingSpace - spacing)
            let adjustMentWidth = (trailingSpace / 2 ) - spacing
            
            HStack(spacing: spacing){
                ForEach(list){item in
                    content(item)
                        .frame(width : proxy.size.width - trailingSpace)
                }
            }
            .padding(.horizontal, spacing)
            .offset(x: (CGFloat(currentIndex) * -width) + (currentIndex != 0 ? adjustMentWidth : 0 ) + offset)
            .gesture(
                DragGesture()
                    .updating($offset, body: {value ,out, _ in
                    
                        out  = value.translation.width
                    })
                    .onEnded({value in
                        let offsetX = value.translation.width
                        
                        let progress = -offsetX / width
                        
                        let roundIndex = progress.rounded()
                        currentIndex = max(min(currentIndex + Int(roundIndex),list.count - 1 ), 0 )
                        currentIndex = index
                    })
                    .onChanged({ value in
                        let offsetX = value.translation.width
                        let progress = -offsetX / width
                        let roundIndex = progress.rounded()
                        index = max(min(currentIndex + Int(roundIndex),list.count - 1 ), 0 )
                    })
            )
        }
        // Animating when offset =0
        .animation(.easeInOut, value: offset == 0 )
    }
}
struct TopicSeriesView: View {
    @State var currentIndex: Int = 0
    @State var transitionView: Int = 0
    @State var posts : [Post] = []
    @State var textContent : String = ""
    @State var currentTab = "Slide Show"
    @Namespace var animation
    var body: some View {
            VStack(spacing: 15){
                VStack(alignment: .leading, spacing:12){
                    Text("Topic Series")
                        .font(.title)
                        .fontWeight(.black).border(Color.black)
                }
                .frame(maxWidth: .infinity)
                .padding()
                SnapCarousel(index: $currentIndex, items: posts){ post in
                    GeometryReader{proxy in
                        let size = proxy.size
                        VStack{
                            Text(post.postImage + " Title").frame(width: 300, height:20).border(Color.green)
                        Image(post.postImage)
                            .resizable()
                            .frame(width: size.width, height: 300)
                            .cornerRadius(12).padding(EdgeInsets(top:0, leading: 0,bottom:0,trailing:0)).overlay(
                                    Button(action:{
                                        print(transitionView)
                                        if transitionView == 0{
                                        transitionView = 2}
                                        transitionView -= 1
                                    }){  if transitionView == 0 {Image(systemName: "paperplane.circle.fill").resizable().foregroundColor(Color.white).frame(width: 30, height:30).position(x:250,y:250)}
                                }
                            ).overlay(    ZStack(alignment: .top) {
                                if transitionView == 1 {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(height: UIScreen.main.bounds.height * 0.1).opacity(0.2)
                                        .transition(AnyTransition.scale.animation(.easeInOut))
                                        .overlay(TextField("내용을 입력하세요", text: $textContent).foregroundColor(Color.white)  .accentColor(Color.white)).overlay(Button(action:{
                                            print(transitionView)
                                            if transitionView == 0{
                                            transitionView = 2}
                                            transitionView -= 1
                                        }) {
                                            if transitionView == 1 {Image(systemName: "paperplane.circle.fill").resizable().foregroundColor(Color.white).frame(width: 30, height:30).position(x:250,y:50)}
                                        })
                                }
                            }
                            .ignoresSafeArea(edges: .bottom))
                            Text(post.postImage + " Content").frame(width: 300, height:80).border(Color.purple)
                            Rectangle().cornerRadius(15).overlay( Text(post.postImage + " option").foregroundColor(Color.white))
                            Rectangle().cornerRadius(15).overlay( Text(post.postImage + " option").foregroundColor(Color.white))
                        }.frame(width: size.width)
                    }
                }
                .padding(.vertical, 40)
                Spacer()
            }
            .frame(maxHeight:.infinity, alignment: .top).border(Color.red)
            .onAppear{
                for index in 1...5{
                    posts.append(Post(postImage: "post\(index)"))
                }
            }
        }
}
struct TopicSeriesView_Previews: PreviewProvider {
    static var previews: some View {
        TopicSeriesView()
    }
}
