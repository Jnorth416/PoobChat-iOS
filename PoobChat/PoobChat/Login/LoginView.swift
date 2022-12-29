//
//  LoginView.swift
//  PoobChat
//
//  Created by Joshua North on 12/26/22.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showCreateAccountView = false
    @StateObject private var userService = UserService()
    
    var body: some View {
        NavigationView{
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
                
                Button("Login"){
                    userService.userLogin(username: username, password: password) { response, error in
                        print(error ?? "No error")
                    }
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .cornerRadius(40)
                
                Button(action: { showCreateAccountView = true }){
                    Text("Create an Account Here")
                    }
                NavigationLink("",destination: CreateAccountView(), isActive: $showCreateAccountView)
                }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
