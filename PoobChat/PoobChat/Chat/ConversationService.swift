//
//  ConversationService.swift
//  PoobChat
//
//  Created by Joshua North on 12/28/22.
//

import Foundation


class ConversationService: ObservableObject{
    
    
    
    
    
    private lazy var apiService = APIService(baseURL: Constants.baseURL)
    private let conversationRepo = ConversationRepository()
    
    
    enum ErrorType: Error{
        case conversationError
    }
    
    enum Endpoints: String {
        case conversation = "/conversation"
        
    }
    
    
    func userConversations(completion: @escaping (Bool, Error?) -> Void){
        apiService.taskForGetRequest(path: Endpoints.conversation.rawValue, isAuthed: true, responseType: ConversationResponseDTO.self) {
            response, error in
            if let error = error {
                completion(false, error)
                
            } else {
                if let response = response{
                    do {
                        try self.conversationRepo.saveConversationDTO(conversationDTOs: response)
                    } catch {
                        print(error)
                    }
                    completion(true, nil)
                    print("boof")
                } else {
                    completion(false, ErrorType.conversationError)
                    print(error)
                }
            }
        }
    }
    
    
    
    
    
}
