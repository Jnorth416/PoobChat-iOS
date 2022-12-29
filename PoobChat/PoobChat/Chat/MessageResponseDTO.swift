//
//  MessageResponseDTO.swift
//  PoobChat
//
//  Created by Joshua North on 12/29/22.
//

import Foundation



struct MessageResponseDTO: Codable {
    let content: String
    let conversationId: String
    let id: String
    let read: Bool
    let recipientId: String
    let senderId: String
    let timestamp: Date
    
    
    enum CodingKeys: String, CodingKey{
        case content
        case conversationId = "conversation_id"
        case id
        case read
        case recipientId = "recipient_id"
        case senderId = "sender_id"
        case timestamp
    }
}
