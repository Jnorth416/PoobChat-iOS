//
//  SenderMessage.swift
//  PoobChat
//
//  Created by Joshua North on 12/29/22.
//

import SwiftUI

struct SenderMessage: View {
    
    var message: String
    var body: some View {
        HStack{
            Spacer()
            Text(message)
                .padding(10)
                .foregroundColor(Color.white)
                .background(Color.blue)
                .cornerRadius(10)
                .padding()
        }
    }
}
struct SenderMessage_Previews: PreviewProvider {
    static var previews: some View {
        SenderMessage(message: "How are you!")
    }
}
