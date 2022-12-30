//
//  MessageRequestDTO.swift
//  PoobChat
//
//  Created by Joshua North on 12/29/22.
//

import Foundation

struct MessageRequestDTO: Codable{
    let message: MessageData
}

struct MessageData: Codable{
    let content: String
    let senderId: String
    let recipientId: String
    
    enum CodingKeys: String, CodingKey{
        case content
        case senderId = "sender_id"
        case recipientId = "recipient_id"
    }
    
    
}
