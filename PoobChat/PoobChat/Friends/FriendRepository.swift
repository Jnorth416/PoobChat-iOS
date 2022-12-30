//
//  FriendRepository.swift
//  PoobChat
//
//  Created by Matt  North on 12/29/22.
//

import Foundation
import CoreData
class FriendRepository {
    private let context = PersistenceController.shared.container.viewContext

    func save(dtos: [FriendResponseDTO]) throws {
        for dto in dtos {
            let friend = getFriend(dto.id) ?? Friend(context: context)
            friend.userId = dto.id
            friend.username = dto.username
        }
        try context.save()
    }

    func delete(id: String) throws {
        guard let friend = getFriend(id) else { return }
        context.delete(friend)
        try context.save()
    }

    func getFriend(_ id: String) -> Friend? {
        let request = Friend.fetchRequest()
        request.predicate = NSPredicate(format: "userId == %@", id)
        let results = try? context.fetch(request)
        return results?.first
    }
}
