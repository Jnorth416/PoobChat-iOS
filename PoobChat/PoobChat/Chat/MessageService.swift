//
//  MessageService.swift
//  PoobChat
//
//  Created by Joshua North on 12/29/22.
//

import Foundation

class MessageService: ObservableObject {
  
    private lazy var apiService = APIService(baseURL: Constants.baseURL)
    private let messageRepo = MessageRepository()
    
    enum ErrorType: Error{
        case messageError
    }
    
    enum Endpoints: String {
        case message = "/message"
    }
    
    func userMessage(id: String, completion: @escaping (Bool, Error?) -> Void){
        apiService.taskForGetRequest(path: messageQueryParameters(id: id), isAuthed: true, responseType: MessageResponseDTO.self) { response, error in
            if let error = error {
                completion(false, error)
                
            } else {
                if let response = response{
                    do {
                        try self.messageRepo.saveMessageDTO(messageDTOs: response)
                    } catch {
                        print(error)
                    }
                    completion(true, nil)
                    print("boof")
                } else {
                    completion(false, ErrorType.messageError)
                    print(error ?? "No error")
                }
            }
        }
    }
    
    func sendUserMessage(content: String, SenderId: String, recipientId: String, completion: @escaping (Bool, Error?) -> Void){
        let body = MessageRequestDTO(message: MessageData(content: content, senderId: SenderId, recipientId: recipientId))
        apiService.taskForPostRequest(path: Endpoints.message.rawValue, isAuthed: true, responseType: MessageResponseDTO.self, body: body) { response, error in
            if let error = error {
                completion(false, error)
                
            } else {
                if let response = response{
                    do {
                        try self.messageRepo.saveMessageDTO(messageDTOs: [response])
                    } catch {
                        print(error)
                    }
                    completion(true, nil)
                    print("boof")
                } else {
                    completion(false, ErrorType.messageError)
                    print(error ?? "No error")
                }
            }
        }
    }
    
    
    func messageQueryParameters(id: String) -> String{
        let combined = "\(Endpoints.message.rawValue)"+"?conversation_id=\(id)"
        
        return combined
    }
    
}
