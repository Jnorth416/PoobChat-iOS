//
//  UserRepository.swift
//  PoobChat
//
//  Created by Joshua North on 12/27/22.
//

import Foundation
import CoreData

class UserRepository {
    let context = PersistenceController.shared.container.viewContext
    
    func saveUser(id: String, username: String, creationDate: Date) throws {
        let user = getUser(id: id) ?? User(context: context)
        user.username = username
        user.id = id
        user.creationDate = Date()
        try context.save()
    }
    
    func getUser(id: String) -> User? {
        let request: NSFetchRequest<User> = User.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id)
        let results = try? context.fetch(request)
        return results?.first
    }
    
    func saveUserDTO(dto: UserResponseDTO) throws {
        let user = getUser(id: dto.id) ?? User(context: context)
        user.username = dto.username
        user.id = dto.id
        user.creationDate = dto.createdAt
        try context.save()
    }
}
