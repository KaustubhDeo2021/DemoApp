//
//  FetchMovieListing.swift
//  DemoApp
//
//  Created by Kaustubh Deo on 26/06/23.
//

import UIKit

protocol FetchMovieListingProtocol {
    func fetchMovieList(completion: @escaping (MovieResult?) -> ())
}

class FetchMovieListingUsecase: FetchMovieListingProtocol {
    
    let networkManager: NetworkManagerProtocol?
    
    init(networkManager: NetworkManagerProtocol?) {
        self.networkManager = networkManager
    }
    
    func fetchMovieList(completion: @escaping (MovieResult?) -> ()) {
        
        self.networkManager?.getAPICall(urlString: Constant.movieUrl) {(result: MovieResult?) in
            
            completion(result)
        }
    }
}
