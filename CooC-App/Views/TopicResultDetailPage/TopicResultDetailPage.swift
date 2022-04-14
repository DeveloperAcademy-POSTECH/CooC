//
//  TopicResultDetailPage.swift
//  CooC-App
//
//  Created by Hyeongjung on 2022/04/11.
//

import SwiftUI

struct TopicResultDetailPage: View {
    let vote_seq: [String] =     ["A", "B", "C","D"] // 투표는 최대 4개가능하므로 4개 생성
    func sum(numbers: [Float]) -> Float{
        return numbers.reduce(0, +)
    }
        var body: some View {
                //NavigationView{
            
                    ScrollView() {
                    VStack{ //이미지
                        Image("\(detailData[0].image)")
                            .resizable()
                            .frame(width: 392, height: 300)
                            .clipShape(RoundedRectangle(cornerRadius: 0))
                        VStack{ //Title
                            HStack{
                                Text("\(detailData[0].title)") //8자넘으면 밑으로 내려감
                                    .font(.system(size: 30))
                                    .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                                Spacer()
                                Button(action: {
                                    print(sum(numbers: detailData[0].vote))
                                }) {
                                    HStack {
                                        Text("\(detailData[0].category)")
                                            .foregroundColor(ColorManager.mainOrange)
                                            .fontWeight(.semibold)
                                            .frame(width: 72, height: 30)
                                    }
                                    .foregroundColor(.black)
                                    .background(.white)
                                    .cornerRadius(20)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.gray, lineWidth: 2)
                                    )
                                }
                                Button(action: {
                                    print("진행중")
                                }) {
                                    HStack {
                                        Text("\(detailData[0].progress)")
                                            .fontWeight(.semibold)
                                            .frame(width: 72, height: 30)
                                    }
                                    .foregroundColor(.black)
                                    .background(.white)
                                    .cornerRadius(20)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.gray, lineWidth: 2)
                                    )
                                }
                            }
                        //.padding(.horizontal)
                        HStack{ //날짜
                            Text("게시날짜 |")
                                .foregroundColor(ColorManager.mainOrange)
                                //.padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                            Text("\(detailData[0].date)")
                                .foregroundColor(ColorManager.mainOrange)
                            Spacer()
                        }
                        .padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
                        
                            HStack{ //내용
                            Text("\(detailData[0].detail)")
                                .font(.system(size: 18))
                                .frame(width: 300)
                                .lineSpacing(4)
                                Spacer()
                        }
                        .padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
                        
                            HStack{
                            NavigationLink(destination: LookAroundView()){
                                Image("top")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                    .navigationBarHidden(true)
                            }
                            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 10))
                            Text("\(detailData[0].name)")
                            Spacer()
                        }
                        .padding(.init(top: 0, leading: 10, bottom: 20, trailing: 0))
                        
                        VStack{// VStack시작
                            
                            //HStack{

                            ForEach(0 ..< detailData[0].vote.count){ number in
                                    VStack{
                                        HStack{
                                            Text("\(vote_seq[number]). \(detailData[0].vote_list[number]) \(Int(detailData[0].vote[number]/sum(numbers:detailData[0].vote)*100))%")
                                                .padding(.leading)
                                            Spacer()
                                        }
                                    }
                                    HStack{ // 투표 프로그래스뷰
                                        ProgressView(value: detailData[0].vote[number] ,total : sum(numbers:detailData[0].vote))
                                            .progressViewStyle(LinearProgressViewStyle(tint: .red))
                                            .padding(.leading)
                                            .scaleEffect(x:1,y:4,anchor: .center)
                                        Spacer()
                                    }
                                }
                                Spacer()
                            //}
                        } // VStack끝
                        HStack{
                            Text("기타")
                                .padding(.leading)
                            Spacer()
                        }
                        .padding(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
                        ScrollView (.horizontal, showsIndicators: false,content: {
                            HStack{
                                ForEach(0..<detailData[0].etc.count) {number in
                                    Button(action: {
                                        print("Delete tapped!")
                                    }) {
                                        HStack {
                                            Text("\(detailData[0].etc[number])")
                                                .fontWeight(.semibold)
                                                .frame(width: 160, height: 50)
                                        }
                                        .padding()
                                        .foregroundColor(.black)
                                        .background(.white)
                                        .cornerRadius(20)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke(Color.gray, lineWidth: 5)
                                                //.shadow(radius: 5)
                                        )
                                    }
                                }
                                .padding(.leading)
                                Spacer()
                            }
                        })
                        }
                        .padding(.horizontal)
                    Spacer()
                            }
                    .frame(maxWidth: .infinity)
                }
        }
}
    


struct TopicResultDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        TopicResultDetailPage()
    }
}
