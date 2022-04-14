//
//  ModalView.swift
//  CooC-App
//
//  Created by JungHoonPark on 2022/04/10.
//

import SwiftUI

struct ModalContents: View {
    
    var categories = ["Fashions", "Tools", "Electronics", "Relationship"]
    @State var selectedCategory = 0
    @State var title: String = ""
    @State var Contents: String = ""
    @State private var longAnswerToggle = false
    @State private var personalInfoToggle = false
    
    var body: some View {
        return ScrollView() {
            VStack {
                ModalUserImageView()
                VStack(alignment: .leading){
                    Text(/*@START_MENU_TOKEN@*/"제목"/*@END_MENU_TOKEN@*/)
                        .font(.title2)
                        .padding(EdgeInsets(top: 8, leading: 20, bottom: 5, trailing: 0))
                    TextField("당신의 고민 제목을 적어주세요.", text: $title)
                        .textFieldStyle(.roundedBorder)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 15, trailing: 20))
                    
                    //                            Text("You entered: \(title)")
                    Text("상세내용")
                        .font(.title2)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 5, trailing: 0))
                    TextField("당신의 고민 상세 내용을 적어주세요.", text: $Contents)
                        .textFieldStyle(.roundedBorder)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 15, trailing: 20))
                }
                //                VStack(){
                HStack(){
                    Text("카테고리")
                        .font(.title2)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 5, trailing: 0))
                    Spacer()
                }
                VStack(){
                    Picker("카테고리를 선택해주세요.", selection: $selectedCategory) {
                        ForEach(categories, id:\.self) {
                            Text($0)
                        }
                    }      .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                        .pickerStyle(.inline)
                }
                VStack(alignment:.leading){
                    Text("고민 선택지")
                        .font(.title2)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 5, trailing: 0))
                    HStack(){
                        TextField("선택지 1", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            .multilineTextAlignment(.center)
                        //                        Color(red: 242/255, green : 157/255, blue: 53/255)
                        TextField("선택지 2.", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            .multilineTextAlignment(.center)
                    }
                    HStack(){
                        TextField("선택지 3", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            .multilineTextAlignment(.center)
                        TextField("선택지 4.", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            .multilineTextAlignment(.center)
                        
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                }
                .frame(maxWidth:.infinity)
            }
            VStack(){
                DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { Text("마감기한")
                    .font(.title2) })
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 15, trailing: 20))
                Toggle(isOn: $longAnswerToggle) {
                    Text("주관식 의견 받기")
                        .font(.title2)
                }    .padding(EdgeInsets(top: 0, leading: 20, bottom: 15, trailing: 20))
                Toggle(isOn: $personalInfoToggle) {
                    Text("개인 정보공개 여부")
                        .font(.title2)
                }    .padding(EdgeInsets(top: 0, leading: 20, bottom: 15, trailing: 20))
            }
            
        }
    }
}

struct ModalContents_Previews: PreviewProvider {
    static var previews: some View {
        ModalContents()
    }
}
