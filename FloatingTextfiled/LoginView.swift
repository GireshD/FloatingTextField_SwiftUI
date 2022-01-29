//
//  LoginView.swift
//  FloatingTextfiled
//
//  Created by Giresh Dora on 29/01/22.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            VStack {
                FloatingTextFieldView(leftIcon:"person",placeHolder: "Enter Email", text: $email)
                FloatingTextFieldView(leftIcon:"person",placeHolder: "Enter Password", text: $password)
            }
            .padding()
            
            Spacer()
        }
            
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
