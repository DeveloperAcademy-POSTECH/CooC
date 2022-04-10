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
    @EnvironmentObject var searchViewState: SearchViewState
    
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
                HStack {
                    TextField("Search topics", text: $searchViewState.currentSearchText)
                    
                    if searchViewState.currentSearchText.count > 0 {
                        Button(action: {
                            searchViewState.currentSearchText = ""
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
                NavigationLink(destination: SearchResultView(searchText: searchViewState.currentSearchText), isActive: $isText) {
                    Text("Search")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 70, height: 40)
                        .padding(.horizontal, 6)
                        .background(searchViewState.currentSearchText.count > 0 ? .orange : .gray)
                        .cornerRadius(buttonRadius)
                        .shadow(radius: 1)
                        .onTapGesture {
                            self.isText = searchViewState.currentSearchText.count > 0 ? true : false
                            if self.isText {
                                searchViewState.recentSearchTexts = [searchViewState.currentSearchText] + (UserDefaults.standard.array(forKey: "recentSearch") ?? []) as! [String]
                                UserDefaults.standard.set(searchViewState.recentSearchTexts, forKey: "recentSearch")
                            }
                        }
                }
                .disabled(searchViewState.currentSearchText.count > 0 ? false : true)
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
