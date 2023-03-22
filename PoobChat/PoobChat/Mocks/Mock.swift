//
//  Mock.swift
//  PoobChat
//
//  Created by Matt  North on 3/21/23.
//

import Foundation

struct Mock {
    enum Constants {
        static let myUserId = "123"
        static let myFriend = "456"
    }

    static func mockConversations() -> [ConversationResponseDTO] {
        return [ConversationResponseDTO(id: "1",
                                       preview: "blah blah",
                                       unreadCount: 0,
                                       updatedAt: Date(),
                                       username: Constants.myFriend,
                                       recipientId: Constants.myUserId)]
    }

    static func mockMessages() -> [MessageResponseDTO] {
        var messages: [MessageResponseDTO] = []
        for i in 1...100 {
            if i % 2 == 0 {
                let message = MessageResponseDTO(content: "blah blah + \(i)",
                                                 conversationId: "1",
                                                 id: "\(i)",
                                                 read: true,
                                                 recipientId: Constants.myUserId,
                                                 senderId: Constants.myFriend,
                                                 timestamp: Date())
                messages.append(message)
            } else {
                let message = MessageResponseDTO(content: "blah blah + \(i)",
                                                 conversationId: "1",
                                                 id: "\(i)",
                                                 read: true,
                                                 recipientId: Constants.myFriend,
                                                 senderId: Constants.myUserId,
                                                 timestamp: Date())
                messages.append(message)
            }

        }
        return messages
    }
}
