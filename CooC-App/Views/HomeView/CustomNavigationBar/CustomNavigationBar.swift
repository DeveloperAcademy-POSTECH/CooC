//
//  CustomNavigationBar.swift
//  CooC-App
//
//  Created by peo on 2022/04/06.
//

import SwiftUI

struct CustomNavigationBar: View {
    @State private var showModal = false
    
    var body: some View {
        VStack {
            ZStack(alignment: .trailing) {
                HStack {
                    Spacer()
                    
                    Text("Home")
                        .bold()
                        .font(.title2)
                    
                    Spacer()
                }
                
                Button(action: {
                    self.showModal = true
                }) {
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: 24, height: 24)
                        .padding(.bottom, 3)
                        .padding(.trailing, 15)
                }
            }
            .padding(.top, 30)
            .padding(.bottom, 5)
            
            SearchBar()
                .padding(.horizontal, horizontalDefaultPadding)
            
            FilterButtonList()
                .padding(.top, 5)
                .padding(.bottom, 10)
        }
        .background(
            Rectangle()
                .fill(.white)
                .frame(width: .infinity, height: 140)
        )
    }
}

struct CustomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        Text("")
    }
}

extension UINavigationController: ObservableObject, UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
