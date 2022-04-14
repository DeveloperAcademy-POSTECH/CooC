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
            
            
            if textView.text.count < 50 {
            self.parent.text = textView.text
            }
            else {
                textView.text.removeLast()
            }
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
    var TSoption3 : [ Int : Double ]
    var TSoption4 : [ Int : String]
    var TSoption4sum : Double
    var transitionView1 : Bool
    
    
}
struct  SnapCarousel<Content: View, T: Identifiable> : View{
    
    var content: (T) -> Content
    var list: [T]
    var spacing: CGFloat
    var trailingSpace: CGFloat
    @Binding var isOn: [Bool]
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
      
    @Binding var index: Int
    init(spacing : CGFloat = 15, trailingSpace : CGFloat = 100, index : Binding<Int> , items:[T], isOn: Binding<[Bool]>, @ViewBuilder content: @escaping (T)-> Content ){
        self._isOn = isOn
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
                        update(index: index)
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
struct LookAroundView: View {
    @State var currentIndex: Int = 0
    @State var transitionView: Int = 0
    @State var posts : [Post] = []
    @State var textContent : String = ""
    @Namespace var animation
    @State var isOn = [true]
    var body: some View {
        VStack(spacing: 15){
            
            VStack(alignment: .leading, spacing:12){
                Text("Topic Series")
                    .font(.title)
                    .fontWeight(.black)
            }
            .frame(maxWidth: .infinity)
            .padding()
            
            SnapCarousel(index: $currentIndex, items: posts, isOn : $isOn ){ post in
                
                GeometryReader{proxy in
                    let size = proxy.size
                    
                    VStack{
                    VStack{
                        Text(post.TStitle).frame(width: 300, height:20)
                        ZStack{
                        
                            Image(post.postImage)
                                .resizable()
                                .frame(width: isOn[post.PostIndex] ? size.width : size.width-50, height: isOn[post.PostIndex] ? 300 : 250 )
                                .cornerRadius(12).padding(EdgeInsets(top:0, leading: 0,bottom:0,trailing:0))
                            
                            Button(action:{
                                
                                posts[post.PostIndex].transitionView1 = true
                            }){
                                
                                if post.transitionView1 == false && isOn[post.PostIndex] == true {
                                    
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
                                        textContent = ""
                                    }){Image(systemName: "paperplane.circle.fill").resizable().foregroundColor(Color.orange).background(Color.white).cornerRadius(15).frame(width: 30, height:30)}.offset(x:125,y:-20)
                                }
                            }
                        }
                        .overlay(    ZStack(alignment: .top) {
                            
                        }
                            .ignoresSafeArea(edges: .bottom))
                        
                        Text(post.TScontent).frame(width: 250, height:80, alignment: .topLeading ).font(.system(size:15))
                        
                        
                        ForEach((1...post.TSoption2.count), id: \.self) {
                         
                            let k = $0
                            if post.TSoption2[k]! == false { Text( post.TSoption[k]! ).frame(width: 250, height:30).overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 4)).overlay(
                                    Button(action:{
                                        
                                        for i in 1...posts[post.PostIndex].TSoption.count{
                                            if i == k {
                                                posts[post.PostIndex].TSoption2[i] = !posts[post.PostIndex].TSoption2[i]!
                                                let  a = (posts[post.PostIndex].TSoption3[i]! + 1 )*100 /   (post.TSoption4sum+1)
                                               posts[post.PostIndex].TSoption[i] = String(format: "%.1f",a)+"%"
                                            }
                                            else {
                                                posts[post.PostIndex].TSoption2[i] = false
                                                let  a = (posts[post.PostIndex].TSoption3[i]! )*100 / (  post.TSoption4sum+1)
                                               posts[post.PostIndex].TSoption[i] = String(format: "%.1f",a)+"%"
                                              
                                            }
                                        }
                                        
                                    }){
                                        
                                        
                                        if post.TSoption2[k]! == false{  Rectangle().cornerRadius(15).frame(width: 250, height:30).border(Color.purple).opacity(0)
                                        }
                                        
                                        else{
                                            Rectangle().cornerRadius(15).frame(width: 250, height:30).border(Color.purple).opacity(0)
                                        }
                                        
                                    } )
                                
                            }
                            else{
                                Text( post.TSoption[k]! ).frame(width: 250, height:30).overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.orange, lineWidth: 4)).overlay(
                                        Button(action:{
                                            posts[post.PostIndex].TSoption2[k] = !posts[post.PostIndex].TSoption2[k]!
                                            for i in 1...posts[post.PostIndex].TSoption.count{
                                                posts[post.PostIndex].TSoption[i] = posts[post.PostIndex].TSoption4[i]}
                                        }){
                                            
                                            
                                            if post.TSoption2[k]! == false{  Rectangle().cornerRadius(15).frame(width: 250, height:30).border(Color.purple).opacity(0)
                                     
                                            }
                                            
                                            else{
                                                Rectangle().cornerRadius(15).frame(width: 250, height:30).border(Color.purple).opacity(0)
                                            }
                                            
                                        } )
                                
                                
                            }
                        }
                        
                        
                    }.frame(width: size.width , height : 580 ,alignment : .top).padding(EdgeInsets(top:20, leading: 5,bottom:20,trailing:5)).overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.orange, lineWidth: 1))
                }
                }
            }
         
            Spacer()
            
        }
        .frame(maxHeight:.infinity, alignment: .top)
        .onAppear{
             // TStitle -> title  TScontent -> detail   TSoption -> vote_list   이미지명 
            posts.append(Post(PostIndex: 0 , postImage: "food", TStitle : "오늘 뭐 먹지" ,TScontent: "너무 배가 고픈데 오늘은 뭐 먹을까요? 추천해주세요 추천해주세요 추천해주세요 추천해주세요", TSoption : [1:"돈까스"  , 2:"치킨"],TSoption2 : [1: false  , 2: false ], TSoption3 : [1: 150  , 2: 100 ], TSoption4 : [1:"돈까스"  , 2:"치킨"],TSoption4sum:250,  transitionView1 : false ))
            
            posts.append(Post (PostIndex: 1,postImage: "game", TStitle : "무슨 게임할까" ,TScontent: "스트레스 해소용 게임 추천해주세요", TSoption : [1: "서든어택" , 2: "오버워치", 3: "롤"], TSoption2 : [1: false  , 2: false , 3: false], TSoption3 : [1: 200  , 2: 100 , 3: 400] , TSoption4 :[1: "서든어택" , 2: "오버워치", 3: "롤"],TSoption4sum:700 ,transitionView1 : false  ))
            
            posts.append(Post( PostIndex: 2,postImage: "movie", TStitle : "드라마 뭐가 재밌지",TScontent: "너무 배가 고픈데 오늘은 뭐 먹을까요? 추천해주세요", TSoption : [1: "파친코" , 2: "너의 목소리가 들려" ] , TSoption2 : [1: false , 2:false ],TSoption3 :[1:  200  , 2 :  150], TSoption4 : [1: "파친코" , 2: "너의 목소리가 들려" ]  ,TSoption4sum:350, transitionView1 : false ))
            
            posts.append(Post( PostIndex: 3,postImage: "fruit", TStitle : "과일 뭐 먹을까" ,TScontent: "후식용 과일 추천해주세요", TSoption : [ 1: "사과" ,2:  "배"], TSoption2 : [ 1: false , 2:  false ], TSoption3 :[1:  200  , 2 :  100],  TSoption4 : [ 1: "사과" ,2:  "배"],TSoption4sum:300, transitionView1 : false))
            
            posts.append(Post( PostIndex: 4,postImage: "shorts", TStitle : "오늘 룩 어떄?" ,TScontent: "너무 배가 고픈데 오늘은 뭐 입을까요? 추천해주세요", TSoption : [1:  "반바지"  , 2 :  "긴바지", ],TSoption2 : [1:  false  , 2 :  false],TSoption3 :[1:  200  , 2 :  100],TSoption4 :  [1:  "반바지"  , 2 :  "긴바지", ],TSoption4sum:300, transitionView1 : false))
            
            posts.append(Post( PostIndex: 5,postImage: "phone", TStitle : "핸드폰 살까?" ,TScontent: "둘다 사고싶은데 추천해주세요", TSoption : [1:  "아이폰"  , 2 :  "갤럭시", ],TSoption2 : [1:  false  , 2 :  false],TSoption3 :[1:  200  , 2 :  100],TSoption4 :  [1:  "아이폰"  , 2 :  "갤럭시", ],TSoption4sum:300, transitionView1 : false))
            
            posts.append(Post( PostIndex: 6,postImage: "AI", TStitle : "앞으로 뭐 해먹고 살까?" ,TScontent: "무슨 직업이 뜰까요? 추천해주세요", TSoption : [1:  "AI" , 2 :  "치킨집", ],TSoption2 : [1:  false  , 2 :  false],TSoption3 :[1:  200  , 2 :  100],TSoption4 :  [1:  "AI" , 2 :  "치킨집", ],TSoption4sum:300 , transitionView1 : false))
            
            posts.append(Post( PostIndex: 7,postImage: "run", TStitle : "노래 추천해줘",TScontent: "오늘 날씨 좋은데 조깅할 예정입니다. 무슨 노래가 좋을까요?", TSoption : [1:  "루시-조깅" , 2 :  "한비-위켄더" ],TSoption2 : [1:  false  , 2 :  false],TSoption3 :[1:  200  , 2 :  100],TSoption4 :  [1:  "루시-조깅" , 2 :  "한비-위켄더" ],TSoption4sum:300 , transitionView1 : false))
            
            posts.append(Post( PostIndex: 8,postImage: "chicken", TStitle :  "저녁메뉴 추천 좀" ,TScontent: "너무 배가 고픈데 오늘은 뭐 먹을까요? 추천해주세요", TSoption : [1:  "돈까스"  , 2 :  "치킨", ],TSoption2 : [1:  false  , 2 :  false],TSoption3 :[1:  200  , 2 :  100],TSoption4 :  [1:  "돈까스"  , 2 :  "치킨", ],TSoption4sum: 300 , transitionView1 : false))
            
            
            
            
            for _ in 1...posts.count{
                    isOn.append(false)
            }
        }
    }
}



struct LookAroundView_Previews: PreviewProvider {
    static var previews: some View {
        LookAroundView()
    }
}
