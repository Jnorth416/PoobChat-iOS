//
//  FriendService.swift
//  PoobChat
//
//  Created by Matt  North on 12/29/22.
//

import Foundation

class FriendService: ObservableObject {
    enum Endpoint: String {
        case friend = "/friend"
    }
    private let apiService = APIService(baseURL: Constants.baseURL)
    private let friendRepo = FriendRepository()
    
    func getFriends(_ completion: @escaping (Bool, Error?) -> Void) {
        apiService.taskForGetRequest(path: Endpoint.friend.rawValue,
                                     isAuthed: true,
                                     responseType: FriendResponseDTO.self) {[weak self] friends, err in
            if let error = err {
                completion(false, error)
                return
            }
            do {
                try self?.friendRepo.save(dtos: friends ?? [])
                completion(true, nil)
            } catch {
                completion(false, error)
            }
        }
    }
    
    func deleteFriend(id: String, completion: @escaping (Bool, Error?) -> Void) {
        apiService.taskForDeleteRequest(path: Endpoint.friend.rawValue + "?id=\(id)",
                                        isAuthed: true) {[weak self] _, err in
            if let error = err {
                completion(false, error)
                return
            }
            do {
                try self?.friendRepo.delete(id: id)
                completion(true, nil)
            } catch {
                completion(false, error)
            }
        }
    }
}
