//
//  ListingViewModelTests.swift
//  DemoAppTests
//
//  Created by Kaustubh Deo on 26/06/23.
//

import XCTest
@testable import DemoApp
final class CollectionViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
 
    // MARK: - testfetchMovieListingSuccess
    func testfetchMovieListingSuccess() throws {
        
       // Given
        let fetchMovieListingUsecaseMock = FetchMovieListingUsecaseMock(result: true)
       let collectionViewModel = CollectionViewModel(fetchMovieListingUsecase: fetchMovieListingUsecaseMock)
    
        // When
        collectionViewModel.fetchMovieListing { result in
            
            // Then
            XCTAssertNotNil(result)
        }
    }
    
    
    // MARK: - testfetchMovieListingFailure
    func testfetchMovieListingFailure() throws {
        
       // Given
        let fetchMovieListingUsecaseMock = FetchMovieListingUsecaseMock(result: false)
       let collectionViewModel = CollectionViewModel(fetchMovieListingUsecase: fetchMovieListingUsecaseMock)
    
        // When
        collectionViewModel.fetchMovieListing { result in
            
            // Then
            XCTAssertNil(result)
        }
    }
}
