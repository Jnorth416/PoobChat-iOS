//
//  UserResponseDTO.swift
//  PoobChat
//
//  Created by Joshua North on 12/28/22.
//

import Foundation



struct LoginResponseDTO: Codable{
    let token: String
    let user: UserResponseDTO
}

struct UserResponseDTO: Codable{
    let createdAt: Date
    let id: String
    let pushToken: String?
    let username: String
    
    
    
    enum CodingKeys: String, CodingKey{
        case createdAt = "inserted_at"
        case id
        case pushToken = "push_token"
        case username
    }
}
