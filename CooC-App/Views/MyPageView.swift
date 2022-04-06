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
    let grayTitle = Color(red: 0.95, green: 0.95, blue: 0.95)
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    grayTitle.frame(width: 390, height: 210)
                    
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
                        
                        HStack{
                            Image("Men")
                                .resizable()
                                .cornerRadius(20)
                                .frame(width: 130, height: 130)
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 20, trailing: 0))
                            
                        
                            RoundedRectangle(cornerRadius: 20)
                                .strokeBorder(Color.orange)
                                .frame(width: 230, height: 130)
                                .padding(EdgeInsets(top: 10, leading: 0, bottom: 20, trailing: 10))
                                
                        }
                    }
                    
                }
                
                
                HStack {
                    Button(action: {
                        
                    }){
                        Text("OOO 님의 고민")
                            .foregroundColor(.black)
                            .padding()
                            
                    }
                    
                    Button(action: {
                        
                    }){
                        Text("OOO 님이 응답한 고민")
                            .foregroundColor(.black)
                            .padding()
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
