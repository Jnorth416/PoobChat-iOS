//
//  CreateAccountView.swift
//  PoobChat
//
//  Created by Joshua North on 12/26/22.
//

import SwiftUI

struct CreateAccountView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @StateObject private var userService = UserService()
    
    var body: some View {
        VStack(spacing: 16){
            Text("Poob Chat")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Image(systemName: "ellipsis.message")
                .font(.system(size: 150))
                .scaledToFit()
                .padding()
            
            TextField("Username", text: $username)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(40)
            
            TextField("Password", text: $password)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(40)
            
            TextField("Confirm Password", text: $confirmPassword)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(40)
            
            Button("Create My Account"){
                if password == confirmPassword {
                    userService.userRegistration(username: username, password: password) { response, error in
                        print(error)
                    }
                }
            }
            .foregroundColor(.white)
            .frame(width: 300, height: 50)
            .background(Color.blue)
            .cornerRadius(40)
        }
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
