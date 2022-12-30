//
//  MessageRepository.swift
//  PoobChat
//
//  Created by Joshua North on 12/29/22.
//

import Foundation
import CoreData


class MessageRepository{
    let context = PersistenceController.shared.container.viewContext
    
    func saveMessageDTO(messageDTOs: [MessageResponseDTO]) throws {
        for dto in messageDTOs  {
            let message = getMessage(id: dto.id ) ?? Message(context: context)
            message.content = dto.content
            message.id = dto.id
            message.read = dto.read
            message.recipientId = dto.recipientId
            message.senderId = dto.senderId
            message.timestamp = dto.timestamp
            message.conversationId = dto.conversationId
        }
        try context.save()
    }
    
    func getMessage(id: String) -> Message? {
        let request: NSFetchRequest<Message> = Message.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id)
        let results = try? context.fetch(request)
        return results?.first
    }
}
