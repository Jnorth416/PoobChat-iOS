//
//  ConversationRepository.swift
//  PoobChat
//
//  Created by Joshua North on 12/28/22.
//

import Foundation


class ConversationRepository{
    let context = PersistenceController.shared.container.viewContext
    
    
    func saveConversationDTO(conversationDTOs: [ConversationResponseDTO]) throws {
        for dto in conversationDTOs  {
            let conversation = Conversation(context: context)
            conversation.username = dto.username
            conversation.id = dto.id
            conversation.preview = dto.preview
            conversation.unreadCount = dto.unreadCount
            conversation.updatedAt = dto.updatedAt
        }
        try context.save()
    }
}
