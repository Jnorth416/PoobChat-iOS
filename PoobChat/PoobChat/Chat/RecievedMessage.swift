//
//  RecievedMessage.swift
//  PoobChat
//
//  Created by Joshua North on 12/29/22.
//

import SwiftUI

struct RecievedMessage: View {
    var message: String
    var body: some View{
        
        HStack(alignment: .bottom, spacing: 15){
            Text(message)
                
                .padding(10)
                .foregroundColor(Color.black)
                .background(Color("receivedMsgBackground"))
                .cornerRadius(10)
                .padding()
                
            Spacer()
        }
    }
}

struct RecievedMessage_Previews: PreviewProvider {
    static var previews: some View {
        RecievedMessage(message: "Hello Ploob")
    }
}
