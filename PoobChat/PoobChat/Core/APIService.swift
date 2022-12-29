//
//  APIService.swift
//  PoobChat
//
//  Created by Joshua North on 12/28/22.
//

import Foundation



class APIService{
    enum ErrorType: Error {
        case invalidURL
    }
    
    let baseURL: String
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    func taskForGetRequest<ResponseType: Decodable>(path: String, isAuthed: Bool, responseType: ResponseType.Type, completion: @escaping ([ResponseType]?, Error?) -> Void) {
        guard let url = urlPath(url: path) else {
            completion(nil, ErrorType.invalidURL)
            return
        }
        var request = URLRequest(url: url)
        if isAuthed == true, let token = UserDefaults.standard.object(forKey: Constants.tokenKey) {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "authorization")
        }
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion(nil,error)
                return
            }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            print(String(data: data, encoding: .utf8)!)
            do {
                let responseObject = try decoder.decode([ResponseType].self, from: data)
                DispatchQueue.main.async{
                    completion(responseObject,nil)
                    print(error ?? "No error")
                }
                print(responseObject)
            }catch {
                DispatchQueue.main.async{
                    completion(nil,error)
                    print(error)
                }
                return
            }
        }
        task.resume()
    }
    
    func taskForPostRequest<RequestType: Encodable, ResponseType: Decodable>(path: String, responseType: ResponseType.Type, body: RequestType, completion: @escaping(ResponseType?,Error?) -> Void){
        guard let url = urlPath(url: path) else {
            completion(nil, ErrorType.invalidURL)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONEncoder().encode(body)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if error != nil { // Handle error…
                completion(nil,error)
                return
            }
            guard let data = data else {
                completion(nil, error)
                return
            }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                completion(responseObject,error)
            }catch {
                completion(nil,error)
                print(error)
                return
            }
            
        }
        task.resume()
    }
    
    func taskForPutRequest<RequestType: Encodable, ResponseType: Decodable>(path: String, responseType: ResponseType.Type, body: RequestType, completion: @escaping(ResponseType?,Error?) -> Void){
        guard let url = urlPath(url: path) else {
            completion(nil, ErrorType.invalidURL)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONEncoder().encode(body)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if error != nil {
                completion(nil,error)
                return
            }
            guard let data = data else {
                completion(nil, error)
                return
            }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                completion(responseObject,error)
            }catch {
                completion(nil,error)
                print(error)
                return
            }
            
        }
        task.resume()
    }
    
    func logoutFunc(path: String, completion: @escaping(Bool,Error?) -> Void){
        guard let url = urlPath(url: path) else {
            completion(false, ErrorType.invalidURL)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
          if error != nil { // Handle error…
              return
          }
        }
        task.resume()
    }
    
    private func urlPath(url: String) -> URL? {
        let url = URL(string: "\(baseURL)\(url)")
        return url
    }
}

