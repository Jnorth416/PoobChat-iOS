//
//  RootView.swift
//  PoobChat
//
//  Created by Joshua North on 12/26/22.
//

import SwiftUI

struct RootView: View {
    var isLoggedIn = true
    var body: some View {
        if isLoggedIn == true{
            LoginView()
        }else{
            HomeView()
        }
    }
}
    
struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
