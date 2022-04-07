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
                                Text("Hi Hello")
                                    .font(.title2)
                                
                                Spacer().frame(height: 5)
                                
                                Text("Nice to meet you")
                                    .font(.body)
                                
                                Spacer().frame(height: 15)
                                
                                Text("Category")
                                    .font(.body)
                                
                                Spacer().frame(height: 10)

                                HStack(spacing: 10){
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.white)
                                        .border(Color.orange)
                                        .frame(width: 50, height: 25)
                                    
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.white)
                                        .border(Color.orange)
                                        .frame(width: 50, height: 25)
                                    
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.white)
                                        .border(Color.orange)
                                        .frame(width: 50, height: 25)
                                }
                                
                                Spacer().frame(height: 10)
                            }
                            
                        }
                    }
                    
                }
                
                HStack {
                    Button(action: {
                        
                    }){
                        Text("OOO 님의 고민")
                            .font(.footnote)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .frame(width: 180, height: 30)
                            .background(chosenButton)
                            .cornerRadius(12)
                    }
                    
                    Spacer().frame(width: 5)
                    
                    Button(action: {
                        
                    }){
                        Text("OOO 님이 응답한 고민")
                            .font(.footnote)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .frame(width: 180, height: 30)
                            .background(notChosenButton)
                            .cornerRadius(12)
                            
                    }
                    
                }
                
                List(0..<7) { row in
                    NavigationLink(destination: Text("Detail Question \(row+1)")){
                        Text("Question \(row+1)")
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
