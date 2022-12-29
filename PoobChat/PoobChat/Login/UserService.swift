//
//  UserService.swift
//  PoobChat
//
//  Created by Joshua North on 12/28/22.
//

import Foundation

class UserService: ObservableObject {
    
    enum ErrorType: Error{
        case registrationError
        case loginError
    }
    
    private lazy var apiService = APIService(baseURL: Constants.baseURL)
    private let userRepo = UserRepository()
    enum Endpoints: String {
        case register = "/register"
        case login = "/login"
    }
    
    func userRegistration(username: String, password: String, completion: @escaping (Bool, Error?) -> Void){
        let body = LoginRequestDTO(username: username, password: password)
        apiService.taskForPostRequest(path: Endpoints.register.rawValue, isAuthed: false, responseType:  LoginResponseDTO.self, body: body) {
            response, error in
            if let error = error {
                completion(false, error)
                
            } else {
                if let response = response{
                    do {
                        try self.userRepo.saveUserDTO(dto: response.user)
                        UserDefaults.standard.set(response.token, forKey: Constants.tokenKey)
                    } catch {
                        print(error)
                    }
                    completion(true, nil)
                    print("boof")
                } else {
                    completion(false, ErrorType.registrationError)
                    print(error ?? "No error")
                }
            }
        }
    }
    
    func userLogin(username: String, password: String, completion: @escaping (Bool, Error?) -> Void){
        let body = LoginRequestDTO(username: username, password: password)
        apiService.taskForPostRequest(path: Endpoints.login.rawValue, isAuthed: false, responseType: LoginResponseDTO.self, body: body) {
            response, error in
            if let error = error {
                completion(false, error)
                
            } else {
                if let response = response{
                    do {
                        try self.userRepo.saveUserDTO(dto: response.user)
                        UserDefaults.standard.set(response.token, forKey: Constants.tokenKey)
                        
                    } catch {
                        print(error)
                    }
                    completion(true, nil)
                    print("boof")
                } else {
                    completion(false, ErrorType.loginError)
                    print(error ?? "No error")
                }
            }
        }
    }
}
