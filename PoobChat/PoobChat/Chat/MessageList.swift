//
//  Message List.swift
//  PoobChat
//
//  Created by Joshua North on 12/29/22.
//

import SwiftUI

struct MessageList: View {

    @FetchRequest(sortDescriptors: []) var users: FetchedResults<User>
    @FetchRequest var messages: FetchedResults<Message>
    
    init(convoId: String) {
        _messages = FetchRequest<Message>(
            sortDescriptors: [NSSortDescriptor(key: "timestamp", ascending: true)],
            predicate: NSPredicate(format: "conversationId == %@", convoId)
        )
    }
    
    var body: some View {
        ScrollView {
            ForEach(messages, id: \.self) { message in
                if message.senderId == users.first?.id {
                    HStack{
                        Spacer()
                        SenderMessage(message: message.content ?? "?")
                            
                    }
                } else {
                    HStack{
                        Spacer()
                        RecievedMessage(message: message.content ?? "?", timestamp: message.timestamp ?? Date())
                            
                    }
                }
            }
        }
    }
}

struct MessageList_Previews: PreviewProvider {
    static var previews: some View {
        MessageList(convoId: "poob")
    }
}
