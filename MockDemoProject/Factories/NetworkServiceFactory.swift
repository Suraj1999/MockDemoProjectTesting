//
//  NetworkServiceFactory.swift
//  MockDemoProject
//
//  Created by Suraj Gupta on 17/04/24.
//

import Foundation


class NetworkServiceFactory {
    
    static func create() -> NetworkService {
        
        let environment = ProcessInfo.processInfo.environment["ENV"]
        
        if let environment = environment {
            if environment == "TEST"{
                return MockWebService()
            } else {
                return Webservice()
            }
        } else {
            return Webservice()
        }
    }
}
