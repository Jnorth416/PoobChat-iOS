//
//  MessageView.swift
//  PoobChat
//
//  Created by Joshua North on 12/29/22.
//

import SwiftUI

struct MessageView: View {
    
    @FetchRequest(sortDescriptors: []) var conversation: FetchedResults<Conversation>
    let messageService = MockMessageService()
    
    let conversationId: String
    let recipientId: String
    let username: String
    var body: some View {
        Divider()
        VStack {
//            MessageNavBar()
            MessageList(convoId: conversationId)
            Divider()
            MessageChatBox(recipientId: recipientId)
        }
        
        .task {
            messageService.userMessage(id: conversationId) { success, error in
                print("boof")
            }
        }
        .navigationTitle(username)
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(conversationId: "id", recipientId: "arggghhhh", username: "Ploobert")
    }
}
