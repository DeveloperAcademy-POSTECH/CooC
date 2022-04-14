//
//  ModalNavigationBar.swift
//  CooC-App
//
//  Created by JungHoonPark on 2022/04/10.
//

import SwiftUI

struct ModalView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            NavigationView {
                ModalContents()
                    .navigationBarTitle("고민 업로드", displayMode: .inline)
                    .navigationBarItems(leading: Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("취소")
                            .foregroundColor(Color.orange)
                    }, trailing: Button(action: {
                        print("Edit button pressed...")
                    }) {
                        Text("제출")
                            .foregroundColor(Color.gray)
                    })
                    .background(NavigationConfigurator { nc in
                        nc.navigationBar.barTintColor = .gray
                        nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.darkGray]
                    })
                
            }
        }
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
    
}

struct ModlaView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
