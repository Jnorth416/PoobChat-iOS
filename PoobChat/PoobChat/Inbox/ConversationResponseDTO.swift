//
//  ConversationResponseDTO.swift
//  PoobChat
//
//  Created by Joshua North on 12/28/22.
//

import Foundation


struct ConversationResponseDTO: Codable {
    let id: String
    let preview: String
    let unreadCount: Int64
    let updatedAt: Date
    let username: String
    let recipientId: String
    
    enum CodingKeys: String, CodingKey{
        case id
        case preview
        case unreadCount = "unread_count"
        case updatedAt = "updated_at"
        case username
        case recipientId = "recipient_id"
    }
}
