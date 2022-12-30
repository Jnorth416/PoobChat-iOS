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

    func addFriend(username: String, completion: @escaping (Bool, Error?) -> Void) {
        let reqBody = AddFriendRequestDTO(username: username)
        apiService.taskForPostRequest(path: Endpoint.friend.rawValue,
                                      isAuthed: true, responseType: FriendResponseDTO.self,
                                      body: reqBody) {[weak self] resp, err in
            if let error = err {
                completion(false, error)
                return
            }
            guard let resp = resp else {
                completion(false, nil)
                return
            }
            do {
                try self?.friendRepo.save(dtos: [resp])
                completion(true, nil)
            } catch {
                completion(false, error)
            }
        }
    }
    
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
