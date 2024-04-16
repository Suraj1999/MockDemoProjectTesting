//
//  MockWebService.swift
//  MockDemoProjectUserInterfaceTests
//
//  Created by Suraj Gupta on 17/04/24.
//

import Foundation



class MockWebService: NetworkService {
    
    func login(username: String, password: String, completion: @escaping (Result<Void, NetworkError>) -> Void) {
        
        if username == "JohnDoe" && password == "Password" {
            completion(.success(()))
        } else {
            completion(.failure(.notAuthenticated))
        }
    }
    
}
