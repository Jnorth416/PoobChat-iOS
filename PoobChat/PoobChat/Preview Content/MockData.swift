//
//  MockData.swift
//  PoobChat
//
//  Created by Matt  North on 12/29/22.
//

import Foundation
import CoreData

struct MockData {
    static let friends: [Friend] = [
        Friend.friend(username: "Matt", id: "123"),
        Friend.friend(username: "Tom", id: "456"),
        Friend.friend(username: "Jim", id: "89"),
        Friend.friend(username: "Poobert", id: "122"),
    ]
}

extension Friend {
    static func friend(username: String, id: String) -> Friend {
        let friend = Friend(context: PersistenceController.shared.container.viewContext)
        friend.username = username
        friend.userId = id
        return friend
    }
}

