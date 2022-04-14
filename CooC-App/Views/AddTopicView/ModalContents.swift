//
//  ModalView.swift
//  CooC-App
//
//  Created by JungHoonPark on 2022/04/10.
//

import SwiftUI

struct ModalContents: View {
    
    var categories = ["Fashion", "Food", "Game", "Movie","Tools","Life"]
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
                    Text("Title")
                        .font(.system(size: 17, weight: .regular))
                        .padding(EdgeInsets(top: 8, leading: 20, bottom: 5, trailing: 0))
                    TextField("Please enter the title.", text: $title)
                        .textFieldStyle(.roundedBorder)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 15, trailing: 20))
                    
                    //                            Text("You entered: \(title)")
                    Text("Contents")
                        .font(.system(size: 17, weight: .regular))
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 5, trailing: 0))
                    TextField("Please write somethig here about yourself.", text: $Contents)
                        .textFieldStyle(.roundedBorder)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 15, trailing: 20))
                }
                //                VStack(){
                HStack(){
                    Text("Category")
                        .font(.system(size: 17, weight: .regular))
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 5, trailing: 0))
                    Spacer()
                }
                VStack(){
                    Picker("Please add a category.", selection: $selectedCategory) {
                        ForEach(categories, id:\.self) {
                            Text($0)
                        }
                    }   .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                        .pickerStyle(.menu)    .foregroundColor(ColorManager.mainOrange)
                }
                VStack(alignment:.leading){
                    HStack(){
                        Text("Choice Options")
                            .font(.system(size: 17, weight: .regular))
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 5, trailing: 0))
                        Text("Please enter at least two.")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundColor(ColorManager.subCobaltBlue)
                    }
                    HStack(){
                        TextField("Edit Option 1", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            .multilineTextAlignment(.center)
                            .padding(EdgeInsets(top: 0, leading: 25, bottom: 5, trailing: 2))
                            .textFieldStyle(.roundedBorder)
                            .font(Font.system(size: 13, design: .default))
                            .multilineTextAlignment(.center)
                        //Color(red: 242/255, green : 157/255, blue: 53/255)
                        TextField("Edit Option 2", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            .multilineTextAlignment(.center)
                            .padding(EdgeInsets(top: 0, leading: 2, bottom: 5, trailing: 25))
                            .textFieldStyle(.roundedBorder)
                            .font(Font.system(size: 13, design: .default))
                            .multilineTextAlignment(.center)
                    }
                    HStack(){
                        TextField("Edit Option 3", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            .multilineTextAlignment(.center)
                            .padding(EdgeInsets(top: 0, leading: 25, bottom: 5, trailing: 2))
                            .textFieldStyle(.roundedBorder)
                            .font(Font.system(size: 13, design: .default))
                            .multilineTextAlignment(.center)
                        TextField("Edit Option 4", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            .multilineTextAlignment(.center)
                            .padding(EdgeInsets(top: 0, leading: 2, bottom: 5, trailing: 25))
                            .textFieldStyle(.roundedBorder)
                            .font(Font.system(size: 13, design: .default))
                            .multilineTextAlignment(.center)
                        
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                }
                .frame(maxWidth:.infinity)
            }
            VStack(){
                DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { Text("DeadLine")
                    .font(.system(size: 17, weight: .regular)) })
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 15, trailing: 20))
                Toggle(isOn: $longAnswerToggle) {
                    Text("Acceptable in long sentences")
                        .font(.system(size: 17, weight: .regular))
                }    .padding(EdgeInsets(top: 0, leading: 20, bottom: 15, trailing: 20))
                Toggle(isOn: $personalInfoToggle) {
                    Text("Profile inquiry available")
                        .font(.system(size: 17, weight: .regular))
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
