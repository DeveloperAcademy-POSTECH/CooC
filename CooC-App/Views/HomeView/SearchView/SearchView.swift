//
//  SearchView.swift
//  CooC-App
//
//  Created by peo on 2022/04/06.
//

import SwiftUI

struct SearchView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Button(action: {
                    self.mode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: 13, height: 25)
                }
                .padding(.trailing, 5)
                
                HStack(alignment: .top) {
                    ZStack(alignment: .topLeading) {
                        TextField("Search topics", text: $searchText)
                        if searchText.count == 0 {
                            Text("Search topics")
                                .foregroundColor(.gray)
                        }
                    }
                    
                    
                    if searchText.count > 0 {
                        Button(action: {
                            searchText = ""
                        }) {
                            Image(systemName: "x.circle.fill")
                                .resizable()
                                .frame(width: 18, height: 18)
                                .foregroundColor(.gray)
                        }
                        .padding(.trailing, 8)
                    }
                }
                .padding(.leading, 12)
                .padding(.vertical, 3)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(.gray)
                        .frame(width: .infinity, height: 40)
                )
                
                Button(action: {
                    self.mode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                        .font(.title3)
                        .foregroundColor(.black)
                }
                .padding(.leading, 10)
            }
            .padding(.horizontal, 15)
            .padding(.top, 15)
            
            RecentSearchList()
            
            Spacer()
        }
        .navigationBarHidden(true)
        
        
        }
        
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
