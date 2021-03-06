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
        NavigationView{
        VStack{
            VStack(alignment: .leading){
                Text("Topic Series")
                    .font(.title)
                    .fontWeight(.black)
            }
            .frame(maxWidth: .infinity)
            .padding(EdgeInsets(top: -50, leading: 0, bottom: 50, trailing: 0))
            
            SnapCarousel(index: $currentIndex, items: posts, isOn : $isOn ){ post in
                
                GeometryReader{proxy in
                    let size = proxy.size
                    ZStack{
                        Rectangle().foregroundColor(Color.white)
                            .cornerRadius(buttonRadius)
                            .padding(.vertical, 10)
                            .padding(.horizontal, horizontalDefaultPadding)
                            .background(.white)
                            .cornerRadius(cardRadius)
                            .shadow(radius: 4)
                    VStack{
                        VStack{
                        Text(post.TStitle).frame(width: 300, height:20)
                        ZStack{
                            Image(post.postImage)
                                .resizable()
                                .frame(width: isOn[post.PostIndex] ? size.width : size.width-100, height: isOn[post.PostIndex] ? 200 : 150 )
                                .cornerRadius(12).padding(EdgeInsets(top:0, leading: 0,bottom:0,trailing:0))
                          
                            if post.transitionView1 == false && isOn[post.PostIndex] == true {
                            NavigationLink(destination:  TopicResultDetailPage(dataIndex: $currentIndex) ){
                            Image(systemName: "note.text.badge.plus").resizable().foregroundColor(Color.orange).background(Color.white).cornerRadius(15).frame(width: 30, height:30)
                            }.offset(x:-110,y:75)
                            }
                            
                            Button(action:{
                                
                                posts[post.PostIndex].transitionView1 = true
                            }){
                                
                                if post.transitionView1 == false && isOn[post.PostIndex] == true {
                  
                                    Image(systemName: "paperplane.circle.fill").resizable().foregroundColor(Color.orange).background(Color.white).cornerRadius(15).frame(width: 30, height:30)}
                            }.offset(x:100,y:75)
                            if post.transitionView1 == true {
                                ZStack{
                                  
                                    RoundedRectangle(cornerRadius: 20).foregroundColor(Color.white)  .overlay(RoundedRectangle(cornerRadius: 20)
                                        .stroke(ColorManager.mainOrange, lineWidth: 2))
                                    
                                    .frame(height: UIScreen.main.bounds.height * 0.1)
                                    .transition(AnyTransition.scale.animation(.easeInOut))
                                    TextView(text: $textContent).frame(width: 200, height: 75).offset(x:-18)
                                    
                                    
                                    
                                    Button(action:{
                                        posts[post.PostIndex].transitionView1 = false
                                        textContent = ""
                                    }) {
                                        if post.transitionView1 == true {Image(systemName: "x.circle.fill").resizable().foregroundColor(Color.white).background(Color.orange).cornerRadius(15).frame(width: 15, height:15)}
                                    }.offset(x:124,y:-60)
                                    Button(action:{
                                        posts[post.PostIndex].transitionView1 = true
                                        textContent = ""
                                    }) {
                                        if post.transitionView1 == true {Image(systemName: "paperplane.circle.fill").resizable().foregroundColor(Color.orange).background(Color.white).cornerRadius(15).frame(width: 30, height:30)}
                                    }.offset(x:115,y:-20)
                                    Button(action:{
                                        posts[post.PostIndex].transitionView1 = false
                                        textContent = ""
                                    }){Image(systemName: "paperplane.circle.fill").resizable().foregroundColor(Color.orange).background(Color.white).cornerRadius(15).frame(width: 30, height:30)}.offset(x:115,y:-20)
                                }.foregroundColor(Color.white)
                            }
                        }
                        .overlay(    ZStack(alignment: .top) {
                            
                        }
                            .ignoresSafeArea(edges: .bottom))
                        
                            Text(post.TScontent).frame(width: 250, height:40, alignment: .topLeading ).font(.system(size:15))
                      
                        
                        ForEach((1...post.TSoption2.count), id: \.self) {
                         
                            let k = $0
                            if post.TSoption2[k]! == false {   Text( post.TSoption[k]! ).frame(width: 250, height:30).overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1)    .shadow(radius: 2)).overlay(
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
                                    .stroke(Color.orange, lineWidth: 1)    .shadow(radius: 2)).overlay(
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
                    }.frame(width: size.width , height : 500 ,alignment : .top)
                            .padding(EdgeInsets(top:20, leading: 5,bottom:20,trailing:5))
                }
                    }.frame(height: 500)
                }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            }
        }
        .frame(maxHeight:.infinity, alignment: .top)
        .onAppear{
             // TStitle -> title  TScontent -> detail   TSoption -> vote_list   ???????????? 
            posts.append(Post(PostIndex: 0 , postImage: "food", TStitle : "?????? ??? ??????" ,TScontent: "?????? ?????? ????????? ????????? ??? ????????????? ?????????????????? ?????????????????? ?????????????????? ??????????????????", TSoption : [1:"?????????"  , 2:"??????",3:"??????",4:"??????"],TSoption2 : [1: false  , 2: false,3:false , 4: false ], TSoption3 : [1: 150  , 2: 100 ,3:200, 4: 250], TSoption4 : [1:"?????????"  , 2:"??????",3:"??????",4:"??????"],TSoption4sum:700,  transitionView1 : false ))
            
            posts.append(Post (PostIndex: 1,postImage: "game", TStitle : "?????? ????????????" ,TScontent: "???????????? ????????? ?????? ??????????????????", TSoption : [1: "????????????" , 2: "????????????", 3: "???"], TSoption2 : [1: false  , 2: false , 3: false], TSoption3 : [1: 200  , 2: 100 , 3: 400] , TSoption4 :[1: "????????????" , 2: "????????????", 3: "???"],TSoption4sum:700 ,transitionView1 : false  ))
            
            posts.append(Post( PostIndex: 2,postImage: "movie", TStitle : "????????? ?????? ?????????",TScontent: "?????? ?????? ????????? ????????? ??? ????????????? ??????????????????", TSoption : [1: "?????????" , 2: "?????? ???????????? ??????" ] , TSoption2 : [1: false , 2:false ],TSoption3 :[1:  200  , 2 :  150], TSoption4 : [1: "?????????" , 2: "?????? ???????????? ??????" ]  ,TSoption4sum:350, transitionView1 : false ))
            
            posts.append(Post( PostIndex: 3,postImage: "fruit", TStitle : "?????? ??? ?????????" ,TScontent: "????????? ?????? ??????????????????", TSoption : [ 1: "??????" ,2:  "???"], TSoption2 : [ 1: false , 2:  false ], TSoption3 :[1:  200  , 2 :  100],  TSoption4 : [ 1: "??????" ,2:  "???"],TSoption4sum:300, transitionView1 : false))
            
            posts.append(Post( PostIndex: 4,postImage: "shorts", TStitle : "?????? ??? ???????" ,TScontent: "?????? ?????? ????????? ????????? ??? ????????????? ??????????????????", TSoption : [1:  "?????????"  , 2 :  "?????????", ],TSoption2 : [1:  false  , 2 :  false],TSoption3 :[1:  200  , 2 :  100],TSoption4 :  [1:  "?????????"  , 2 :  "?????????", ],TSoption4sum:300, transitionView1 : false))
            
            posts.append(Post( PostIndex: 5,postImage: "phone", TStitle : "????????? ???????" ,TScontent: "?????? ??????????????? ??????????????????", TSoption : [1:  "?????????"  , 2 :  "?????????", ],TSoption2 : [1:  false  , 2 :  false],TSoption3 :[1:  200  , 2 :  100],TSoption4 :  [1:  "?????????"  , 2 :  "?????????", ],TSoption4sum:300, transitionView1 : false))
            
            posts.append(Post( PostIndex: 6,postImage: "AI", TStitle : "????????? ??? ????????? ???????" ,TScontent: "?????? ????????? ?????????? ??????????????????", TSoption : [1:  "AI" , 2 :  "?????????", ],TSoption2 : [1:  false  , 2 :  false],TSoption3 :[1:  200  , 2 :  100],TSoption4 :  [1:  "AI" , 2 :  "?????????", ],TSoption4sum:300 , transitionView1 : false))
            
            posts.append(Post( PostIndex: 7,postImage: "run", TStitle : "?????? ????????????",TScontent: "?????? ?????? ????????? ????????? ???????????????. ?????? ????????? ?????????????", TSoption : [1:  "??????-??????" , 2 :  "??????-?????????" ],TSoption2 : [1:  false  , 2 :  false],TSoption3 :[1:  200  , 2 :  100],TSoption4 :  [1:  "??????-??????" , 2 :  "??????-?????????" ],TSoption4sum:300 , transitionView1 : false))
            
            posts.append(Post( PostIndex: 8,postImage: "chicken", TStitle :  "???????????? ?????? ???" ,TScontent: "?????? ?????? ????????? ????????? ??? ????????????? ??????????????????", TSoption : [1:  "?????????"  , 2 :  "??????", ],TSoption2 : [1:  false  , 2 :  false],TSoption3 :[1:  200  , 2 :  100],TSoption4 :  [1:  "?????????"  , 2 :  "??????", ],TSoption4sum: 300 , transitionView1 : false))
            
            for _ in 1...posts.count{
                    isOn.append(false)
            }
        }
    }
}
}
