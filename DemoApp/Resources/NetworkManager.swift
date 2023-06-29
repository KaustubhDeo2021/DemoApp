//
//  NetworkManager.swift
//  DemoApp
//
//  Created by Kaustubh Deo on 26/06/23.
//

import UIKit

protocol NetworkManagerProtocol {
    func getAPICall<T: Decodable>(urlString: String, completion: @escaping (T) -> ())
}

class NetworkManager: NetworkManagerProtocol {

    static let shared = NetworkManager()
    
    private init() {
        
    }
    
    func getAPICall<T: Decodable>(urlString: String, completion: @escaping (T) -> ()) {
        let url = URL(string: urlString)!
        URLSession.shared.dataTask(with: URLRequest(url: url)){ data,req,error in
                
            guard let apiData = data else { return }
            
            do {
                 let result = try JSONDecoder().decode(T.self, from: apiData)
                completion(result)
                
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
