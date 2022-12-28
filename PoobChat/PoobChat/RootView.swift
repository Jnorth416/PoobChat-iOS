//
//  RootView.swift
//  PoobChat
//
//  Created by Joshua North on 12/26/22.
//

import SwiftUI

struct RootView: View {

    @FetchRequest(sortDescriptors: []) var users: FetchedResults<User>
    
        var body: some View {
        if users.first == nil {
            LoginView()
        } else {
            tabBar
        }
    }
    
    var tabBar: some View{
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("messages")
                }
            ContactView()
                .tabItem {
                    Image(systemName: "person.circle.fill")
                    Text("Contacts")
                }
        }
    }
}
    
struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
