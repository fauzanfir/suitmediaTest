//
//  NetworkingManager.swift
//  TestUIKit
//
//  Created by Fauzan Firzandy on 11/08/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchUsers(page: Int, completion: @escaping (Result<[User], Error>) -> Void) {
        let urlString = "https://reqres.in/api/users?page=\(page)&per_page=10"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data"])))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(UserResponse.self, from: data)
                completion(.success(response.data))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
