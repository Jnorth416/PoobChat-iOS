//
//  MessageNavBar.swift
//  PoobChat
//
//  Created by Joshua North on 12/29/22.
//

import SwiftUI

struct MessageNavBar: View {
    var body: some View {
            VStack(spacing: 0) {
                HStack(){
                    Button {
                        
                    } label: {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.black)
                            .font(.system(size: 34))
                    }
                    Spacer()
                    VStack(){
                        Text("Username")
                            .font(.system(size: 24, weight: .bold))
                            .border(Color.red)
                    }
                    Spacer()
                }
                .border(Color.blue)
                .padding()
                Divider()
            }
        }
}

struct MessageNavBar_Previews: PreviewProvider {
    static var previews: some View {
        MessageNavBar()
    }
}
