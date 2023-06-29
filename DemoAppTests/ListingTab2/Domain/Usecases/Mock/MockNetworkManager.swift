//
//  MockNetworkManager.swift
//  DemoAppTests
//
//  Created by Kaustubh Deo on 26/06/23.
//

import UIKit
@testable import DemoApp

class MockNetworkManager: NetworkManagerProtocol {

    static let shared = MockNetworkManager()
    
    private init() {
        
    }
    
    func getAPICall<T: Decodable>(urlString: String, completion: @escaping (T) -> ()) {
        do {
            let data = MovieListResponse.response.data(using: .utf8)!
            let result = try JSONDecoder().decode(T.self, from: data)
            completion(result) // Mock response
         } catch {
            print(error)
        }
    }
}
