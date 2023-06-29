//
//  ListingViewModel.swift
//  DemoApp
//
//  Created by Kaustubh Deo on 26/06/23.
//

import UIKit

class ListingViewModel: NSObject {

    var fetchMovieListingUsecase: FetchMovieListingProtocol?
    
    init(fetchMovieListingUsecase: FetchMovieListingProtocol?) {
        self.fetchMovieListingUsecase = fetchMovieListingUsecase
    }
    
    func fetchMovieListing(completion: @escaping (MovieResult?) -> ()) {
        
        fetchMovieListingUsecase?.fetchMovieList(completion: { result in
            completion(result)
        })
    }
}
