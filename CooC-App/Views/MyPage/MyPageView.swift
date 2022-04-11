//
//  MyPageView.swift
//  CooC-App
//
//  Created by peo on 2022/04/05.
//

import SwiftUI

struct MyPageView: View {
    var body: some View {
        NavigationView{
            VStack{
                UserProfile()
                UserQuestionList()
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
