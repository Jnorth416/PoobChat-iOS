//
//  MessageView.swift
//  PoobChat
//
//  Created by Joshua North on 12/29/22.
//

import SwiftUI

struct MessageView: View {
    
    let messageService = MessageService()
    
    let conversationId: String
    var body: some View {
        VStack{
//            MessageNavBar()
            MessageList(convoId: conversationId)
        }
        
        .task {
            messageService.userMessage(id: conversationId) { success, error in
                print("boof")
            }
        }
    }
}


struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(conversationId: "id")
    }
}
