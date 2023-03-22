//
//  MockConversationService.swift
//  PoobChat
//
//  Created by Matt  North on 3/21/23.
//

import Foundation

class MockConversationService: ObservableObject {

    private lazy var apiService = APIService(baseURL: Constants.baseURL)
    private let conversationRepo = ConversationRepository()

    enum ErrorType: Error{
        case conversationError
    }

    enum Endpoints: String {
        case conversation = "/conversation"
    }

    func userConversations(completion: @escaping (Bool, Error?) -> Void){
        do {
            try self.conversationRepo.saveConversationDTO(conversationDTOs: Mock.mockConversations())
        } catch {
            print(error)
        }
    }
}
