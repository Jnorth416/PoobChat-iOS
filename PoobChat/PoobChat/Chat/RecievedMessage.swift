//
//  RecievedMessage.swift
//  PoobChat
//
//  Created by Joshua North on 12/29/22.
//

import SwiftUI

struct RecievedMessage: View {
    var message: String
    var timestamp: Date
    var body: some View{
        
        VStack {
            HStack(alignment: .bottom, spacing: 15){
                Text(message)
                    
                    .padding(10)
                    .foregroundColor(Color.black)
                    .background(Color("receivedMsgBackground"))
                    .cornerRadius(10)
                    .padding()
                
                
                Spacer()
            }
          
            .padding()
            
        }
    }
}

struct RecievedMessage_Previews: PreviewProvider {
    static var previews: some View {
        RecievedMessage(message: "Hello Ploob", timestamp: Date())
    }
}
