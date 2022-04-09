//
//  TopicSeriesView.swift
//  CooC-App
//
//  Created by Byeon jinha on 2022/04/06.
//

import SwiftUI
import UIKit


struct TextView : UIViewRepresentable{
    @Binding var text :String
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    func makeUIView(context:Context) -> UITextView {
        let myTextView = UITextView()
        myTextView.delegate = context.coordinator
        return myTextView
    }
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
    class Coordinator : NSObject, UITextViewDelegate{
        var parent : TextView
        init(_ uiTextView: TextView) {
            self.parent = uiTextView
        }
        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
        }
    }
    
    
    
}



struct Post: Identifiable {
    var PostIndex : Int
    var id = UUID().uuidString
    var postImage: String
    var TStitle : String
    var TScontent : String
    var TSoption : [ Int : String]
    var TSoption2 : [ Int : Bool ]
    var transitionView1 : Bool
   
    
}
struct  SnapCarousel<Content: View, T: Identifiable> : View{
    
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
                    self.content(item)
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
    @Namespace var animation
    var body: some View {
            VStack(spacing: 15){
                VStack(alignment: .leading, spacing:12){
                    Text("Topic Series")
                        .font(.title)
                        .fontWeight(.black)
                }
                .frame(maxWidth: .infinity)
                .padding()
                
                SnapCarousel(index: $currentIndex, items: posts){ post in
                    GeometryReader{proxy in
                        let size = proxy.size
                        VStack{
                            Text(post.TStitle).frame(width: 300, height:20)
                
                        
                            
                            ZStack{
                        Image(post.postImage)
                            .resizable()
                            .frame(width: size.width, height: 300)
                            .cornerRadius(12).padding(EdgeInsets(top:0, leading: 0,bottom:0,trailing:0))
                            
                                    Button(action:{
                                        posts[post.PostIndex].transitionView1 = true
                                    }){

                                        if post.transitionView1 == false {
                                        
                                        Image(systemName: "paperplane.circle.fill").resizable().foregroundColor(Color.orange).background(Color.white).cornerRadius(15).frame(width: 30, height:30)}
                                    }.offset(x:100,y:100)
                                if post.transitionView1 == true {
                                    ZStack{
                                    RoundedRectangle(cornerRadius: 20).foregroundColor(Color.white).overlay(RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.orange, lineWidth: 4))
                                 
                                            .frame(height: UIScreen.main.bounds.height * 0.1)
                                        .transition(AnyTransition.scale.animation(.easeInOut))
                                        TextView(text: $textContent).frame(width: 230, height: 75).offset(x:-18)
                                      
                                        
                                            
                                        Button(action:{
                                            posts[post.PostIndex].transitionView1 = false
                                                textContent = ""
                                            }) {
                                                if post.transitionView1 == true {Image(systemName: "x.circle.fill").resizable().foregroundColor(Color.white).background(Color.orange).cornerRadius(15).frame(width: 15, height:15)}
                                            }.offset(x:135,y:-60)
                                    Button(action:{
                                        posts[post.PostIndex].transitionView1 = true
                                            textContent = ""
                                        }) {
                                            if post.transitionView1 == true {Image(systemName: "paperplane.circle.fill").resizable().foregroundColor(Color.orange).background(Color.white).cornerRadius(15).frame(width: 30, height:30)}
                                        }.offset(x:125,y:-20)
                                        Button(action:{
                                            posts[post.PostIndex].transitionView1 = false
                                            print(posts[post.PostIndex])
                                                textContent = ""
                                        }){Image(systemName: "paperplane.circle.fill").resizable().foregroundColor(Color.orange).background(Color.white).cornerRadius(15).frame(width: 30, height:30)}.offset(x:125,y:-20)
                                    }
                                }
                            }
                            .overlay(    ZStack(alignment: .top) {
                    
                            }
                            .ignoresSafeArea(edges: .bottom))
                    
                            Text(post.TScontent).frame(width: 300, height:80, alignment: .topLeading ).font(.system(size:15))
                           
        
                            ForEach((1...post.TSoption2.count), id: \.self) {
                                let k = ($0)
                                if post.TSoption2[k]! == false { Text( post.TSoption[k]! ).frame(width: 300, height:30).overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 4)).overlay(
                                    Button(action:{
                                        posts[post.PostIndex].TSoption2[k] = !posts[post.PostIndex].TSoption2[k]!
                                        }){
                                        
                                        
                                        if post.TSoption2[k]! == false{  Rectangle().cornerRadius(15).frame(width: 300, height:30).border(Color.purple).opacity(0)
                                        }
                                        
                                            else{
                                                Rectangle().cornerRadius(15).frame(width: 300, height:30).border(Color.purple).opacity(0)
                                            }
                                            
                                    } )
                                
                             }
                                else{
                                    Text( post.TSoption[k]! ).frame(width: 300, height:30).overlay(RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.orange, lineWidth: 4)).overlay(
                                       Button(action:{
                                           posts[post.PostIndex].TSoption2[k] = !posts[post.PostIndex].TSoption2[k]!
                                           print(posts[post.PostIndex].TSoption2[k]) }){
                                           
                                           
                                           if post.TSoption2[k]! == false{  Rectangle().cornerRadius(15).frame(width: 300, height:30).border(Color.purple).opacity(0)
                                           }
                                       
                                               else{
                                                   Rectangle().cornerRadius(15).frame(width: 300, height:30).border(Color.purple).opacity(0)
                                               }
                                               
                                       } )
                                   
                                
                                }
                            }
                            
                            
                        }.frame(width: size.width)
                    }
                }
                .padding(.vertical, 40)
                Spacer()

            }
            .frame(maxHeight:.infinity, alignment: .top)
            .onAppear{

                posts.append(Post(PostIndex: 0 , postImage: "post1", TStitle : "셔츠 봐주세요." ,TScontent: "주황셔츠 괜찮나요?", TSoption : [1:"주황셔츠 입는다."  , 2: "입지 않는다."],TSoption2 : [1: false  , 2: false ], transitionView1 : false ))
                posts.append(Post(PostIndex: 1,postImage: "post2", TStitle : "티 봐주세요." ,TScontent: "노랑티 괜찮나요?", TSoption : [1: "노랑티 입는다." , 2: "입지 않는다.", 3: "옷을 버린다."], TSoption2 : [1: false  , 2: false , 3: false], transitionView1 : false  ))
                
                posts.append(Post(PostIndex: 2,postImage: "post3", TStitle : "청청 패션인데 어떤가요?" ,TScontent: "평소 나름 옷을 잘 입는다고 자부하는 사람입니다. 여러분의 평가를 듣고 싶어서 이렇게 글을 적습니다. 이렇게 입고 소개팅 나가도 될까요?", TSoption : [1: "너무 멋지다" , 2: "진짜 멋지다" , 3: "정말 멋지다"  , 4: "옷을불태운다" ] , TSoption2 : [1: false , 2:false , 3: false  , 4: false ], transitionView1 : false))
                
                posts.append(Post(PostIndex: 3,postImage: "post4", TStitle : "아.....흑흑" ,TScontent: "4", TSoption : [ 1: "value" ,2:  ""], TSoption2 : [ 1: false , 2:  false ], transitionView1 : false))
                posts.append(Post(PostIndex: 4,postImage: "post5", TStitle : "살려주세요." ,TScontent: "5", TSoption : [1:  "value"  , 2 :  "", 3:  "2"],TSoption2 : [1:  false  , 2 :  false, 3:  false], transitionView1 : false))
                
                
            }
        }
}
struct TopicSeriesView_Previews: PreviewProvider {
    static var previews: some View {
        TopicSeriesView()
    }
}
