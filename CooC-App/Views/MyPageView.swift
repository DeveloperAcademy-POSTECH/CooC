//
//  MyPageView.swift
//  CooC-App
//
//  Created by peo on 2022/04/05.
//

import SwiftUI

struct EditProfile: View{
    var body: some View{
        Text("Edit Profile")
    }
}

struct MyPageView: View {
    let titleBackground = Color(red: 240/255, green: 240/255, blue: 240/255)
    let chosenButton = Color(red: 1, green: 152/255, blue: 0)
    let notChosenButton = Color(red: 1, green: 214/255, blue: 146/255)
    
    let name = profileData[5].name
    let introduce = profileData[5].introduce
    let category = profileData[5].category
    
    @State private var clickCheck = true
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    titleBackground.frame(width: 390, height: 210)
                    
                    VStack{
                        Spacer().frame(height: 15)
                        
                        HStack{
                            Spacer().frame(width: 340)
                            
                            NavigationLink(destination: EditProfile()){
                                Image(systemName: "square.and.pencil")
                                    .font(.system(size: 25))
                                    .foregroundColor(.orange)
                            }
                        }
                        
                        HStack(spacing: 30){
                            Spacer().frame(width: 10)
                            
                            Image("Men")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(20)
                                .frame(width: 130, height: 130)
                                .padding(EdgeInsets(top: 10, leading: -80, bottom: 20, trailing: 0))
                            
                            
                            VStack(alignment: .leading){
                                Text("\(name)")
                                    .font(.title2)
                                
                                Spacer().frame(height: 5)
                                
                                Text("\(introduce)")
                                    .font(.body)
                                
                                Spacer().frame(height: 15)
                                
                                Text("Category")
                                    .font(.body)
                                
                                Spacer().frame(height: 10)

                                HStack(spacing: 10){
                                    ForEach(category, id: \.self){
                                        Text($0)
                                            .font(.system(size: 12))
                                            .foregroundColor(Color.black)
                                            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 15)
                                                    .stroke(Color.orange, lineWidth: 2)
                                                )
                                    }
                                }
                                
                                Spacer().frame(height: 10)
                            }
                            
                        }
                    }
                    
                }
                
                
                HStack {
                    Button(action: {
                        self.clickCheck.toggle()
                    }){
                        Text("\(name) 님의 고민")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 180, height: 30)
                            .background(self.clickCheck ? chosenButton : notChosenButton)
                            .cornerRadius(12)
                    }
                    
                    
                    Button(action: {
                        self.clickCheck.toggle()
                    }){
                        Text("\(name) 님이 응답한 고민")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 180, height: 30)
                            .background(self.clickCheck ?  notChosenButton : chosenButton)
                            .cornerRadius(12)
                            
                    }
                    
                }
                
                if self.clickCheck {
                    List(0..<7) { row in
                        NavigationLink(destination: Text("Detail Question \(row+1)")){
                            Text("Question \(row+1)")
                        }
                    }
                }
                if self.clickCheck == false {
                    List(0..<9) { row in
                        NavigationLink(destination: Text("Detail Question \(row+1)")){
                            Text("Question \(row+1) that \(name) Answered")
                        }
                    }
                }
            }
            .navigationBarTitle("My Page", displayMode : .inline)
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
