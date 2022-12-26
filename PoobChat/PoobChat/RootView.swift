//
//  RootView.swift
//  PoobChat
//
//  Created by Joshua North on 12/26/22.
//

import SwiftUI

struct RootView: View {
    var isLoggedIn = false
    var body: some View {
        if isLoggedIn == false {
            LoginView()
        } else {
            HomeView()
        }
    }
}
    
struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
