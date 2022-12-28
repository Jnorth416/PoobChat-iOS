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
    
    func saveUser(id: Int64, username: String, creationDate: Date) throws {
        let user = getUser(id: id) ?? User(context: context)
        user.username = username
        user.id = id
        user.creationDate = Date()
        try context.save()
    }
    
    func getUser(id: Int64) -> User? {
        let request: NSFetchRequest<User> = User.fetchRequest()
        request.predicate = NSPredicate(format: "id == %i", id)
        let results = try? context.fetch(request)
        return results?.first
    }
}
