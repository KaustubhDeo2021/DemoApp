//
//  FetchMovieListingUsecaseMock.swift
//  DemoAppTests
//
//  Created by Kaustubh Deo on 26/06/23.
//

import UIKit
@testable import DemoApp

class FetchMovieListingUsecaseMock: FetchMovieListingProtocol {
   
    let result: Bool
    
    init(result: Bool) {
        self.result = result
    }
    
    func fetchMovieList(completion: @escaping (MovieResult?) -> ()) {
        
        if result == true {
        
            do {
                let data = MovieListResponse.response.data(using: .utf8)!
                let result = try JSONDecoder().decode(MovieResult.self, from: data)
                
                 completion(result) // Mock response
             } catch {
                print(error)
            }
        } else {
            completion(nil)
        }
    }
}
