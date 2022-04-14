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
    @Binding var dataIndex : Int
    @EnvironmentObject var userProfileData: UserProfileData

        var body: some View {
            DetailPageNavigationBar()
            
                    ScrollView() {
                    VStack{ //이미지
                        Image("\(detailData[dataIndex].image)")
                            .resizable()
                            .frame(width: 392, height: 300)
                            .clipShape(RoundedRectangle(cornerRadius: 0))
                        VStack(alignment: .leading){ //Title
                            HStack{
                                Text("\(detailData[dataIndex].title)") //8자넘으면 밑으로 내려감
                                    .font(.title)
                                    .bold()
                                    .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                                Spacer()
                                Button(action: {
                                    print(sum(numbers: detailData[dataIndex].vote))
                                }) {
                                    HStack {
                                        Text("\(detailData[dataIndex].category)")
                                            .foregroundColor(Color.white)
                                            .fontWeight(.semibold)
                                            .frame(width: 72, height: 30)
                                    }
                                    .foregroundColor(.black)
                                    .background(ColorManager.mainOrange)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                                }
                                Button(action: {
                                    print("진행중")
                                }) {
                                    HStack {
                                        Text("\(detailData[dataIndex].progress)")
                                            .foregroundColor(Color.black)
                                            .fontWeight(.semibold)
                                            .frame(width: 72, height: 30)
                                    }
                                    .foregroundColor(.black)
                                    .background(.white)
                                    .cornerRadius(20)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(ColorManager.mainOrange, lineWidth: 2)
                                    )
                                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
                            }
                        //.padding(.horizontal)
                        HStack{ //날짜
                            Text("게시날짜 |")
                                .foregroundColor(ColorManager.subCobaltBlue)
                            Text("\(detailData[dataIndex].date)")
                                .foregroundColor(ColorManager.subCobaltBlue)
                            Spacer()
                        }
                        .padding(.init(top: -10, leading: 0, bottom: 10, trailing: 0))
                        
//                            HStack{ //내용
//                            Text("\(detailData[dataIndex].detail)")
//                                .font(.system(size: 18))
//                                .frame(width: 300)
//                                .lineSpacing(4)
//                                .padding(EdgeInsets(top: 0, leading: -20, bottom: 0, trailing: 0))
//                        }
                        Text("\(detailData[dataIndex].detail)")
                            .font(.system(size: 18))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                        
                            HStack(){
                                ZStack{
                                    Circle()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(ColorManager.subCobaltBlue)
                                    Image(uiImage: userProfileData.profilePicture)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .cornerRadius(25)
                                        .frame(width: 45, height: 45)
                                        .clipShape(Circle())
                                        .navigationBarHidden(true)
                                }
                            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 10))
                            Text("\(userProfileData.profileName)")
                            Spacer()
                            }
                            
                            
                        }
                        .padding(.init(top: 0, leading: 10, bottom: 20, trailing: 0))
                        
                        VStack{// VStack시작
                            
                            //HStack{

                            ForEach(0 ..< detailData[dataIndex].vote.count){ number in
                                    VStack{
                                        HStack{
                                            Text("\(vote_seq[number]). \(detailData[dataIndex].vote_list[number]) \(Int(detailData[dataIndex].vote[number]/sum(numbers:detailData[dataIndex].vote)*100))%")
                                                .padding(.leading)
                                            Spacer()
                                        }
                                    }
                                
                                    HStack{ // 투표 프로그래스뷰
                                        ProgressView(value: detailData[dataIndex].vote[number] ,total : sum(numbers:detailData[dataIndex].vote))
                                            .progressViewStyle(LinearProgressViewStyle(tint: ColorManager.mainOrange))
                                            .padding(.leading)
                                            .scaleEffect(x:1,y:4,anchor: .center)
                                        Spacer()
                                    }
                                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
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
                                ForEach(0..<detailData[dataIndex].etc.count) {number in
                                    Button(action: {
                                        print("Delete tapped!")
                                    }) {
                                        HStack(spacing: 10){
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(ColorManager.subCobaltBlue)
                                                    .frame(width: 165, height: 60)
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(Color.white)
                                                    .frame(width: 160, height: 55)
                                                Text("\(detailData[dataIndex].etc[number])")
                                                    .foregroundColor(.black)
                                                    .fontWeight(.semibold)
                                            }
                                        }
                                        
//                                        HStack {
//                                            Text("\(detailData[dataIndex].etc[number])")
//                                                .fontWeight(.semibold)
//                                                .frame(width: 160, height: 45)
//                                        }
//                                        .padding()
//                                        .foregroundColor(.black)
//                                        .background(.white)
//                                        .cornerRadius(20)
                                    }
                                }
//                                .shadow(color: .gray, radius: 2)
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
    
