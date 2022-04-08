//
//  SearchView.swift
//  CooC-App
//
//  Created by peo on 2022/04/06.
//

import SwiftUI

struct SearchView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var isText = false
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                // 뒤로 가기
                Button(action: {
                    self.mode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .foregroundColor(.orange)
                        .frame(width: 13, height: 25)
                }
                .padding(.trailing, 5)
                
                // SearchBar
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
                            Image(systemName: "xmark.circle.fill")
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
                    RoundedRectangle(cornerRadius: searchBarRadius)
                        .stroke(.gray)
                        .frame(width: .infinity, height: 40)
                )
                
                // Search 버튼
                NavigationLink(destination: SearchResultView(searchText: searchText), isActive: $isText) {
                    Text("Search")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 70, height: 40)
                        .padding(.horizontal, 8)
                        .background(
                            RoundedRectangle(cornerRadius: buttonRadius)
                                .fill(searchText.count > 0 ? .orange : .gray)
                                .shadow(radius: 1)
                                .frame(width: 80, height: 40)
                        )
                        .onTapGesture {
                            self.isText = searchText.count > 0 ? true : false
                        }
                }
                .disabled(searchText.count > 0 ? false : true)
            }
            .padding(.horizontal, horizontalDefaultPadding)
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
