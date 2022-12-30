//
//  MessageChatBox.swift
//  PoobChat
//
//  Created by Joshua North on 12/29/22.
//

import SwiftUI

struct MessageChatBox: View {
    
    @State private var message = ""
    @StateObject private var messageService = MessageService()
    
    @FetchRequest(sortDescriptors: []) var messages: FetchedResults<Message>
    @FetchRequest(sortDescriptors: []) var user: FetchedResults<User>
    
    var recipientId: String
    
    var body: some View {
        
        HStack{
            TextField("Message", text: $message,  axis: .vertical)
                .lineLimit(1...5)
                .padding(11)
                .background(Color.black.opacity(0.05))
                .cornerRadius(40)
            
                
            Button{
                messageService.sendUserMessage(content: message, SenderId: (user.first?.id)!, recipientId: recipientId){ success, error in
                    print("plooberts gangster")
                }
            }label: {
                Text("Send")
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            .padding(.vertical, 5)
            .background(Color.blue
            .frame(width: 80, height: 40)
            .cornerRadius(40)
            )
            
        }
        
        .padding()
    }
}

struct MessageChatBox_Previews: PreviewProvider {
    static var previews: some View {
        MessageChatBox( recipientId: "shut up")
    }
}
