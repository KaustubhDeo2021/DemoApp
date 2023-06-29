//
//  ListingViewModelTests.swift
//  DemoAppTests
//
//  Created by Kaustubh Deo on 26/06/23.
//

import XCTest
@testable import DemoApp
final class ListingViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - testFetchMovieListing
    func testFetchMovieListingSuccess() throws {
       
       // Given
        let fetchMovieListingUsecaseMock = FetchMovieListingUsecaseMock(result: true)
       let listingViewModel = ListingViewModel(fetchMovieListingUsecase: fetchMovieListingUsecaseMock)
        
        // When
        listingViewModel.fetchMovieListing{ result in
            
            // Then
            XCTAssertNotNil(result)
        }
    }
    
    
    func testFetchMovieListingFailure() throws {
       
       // Given
        let fetchMovieListingUsecaseMock = FetchMovieListingUsecaseMock(result: false)
       let listingViewModel = ListingViewModel(fetchMovieListingUsecase: fetchMovieListingUsecaseMock)
        
        // When
        listingViewModel.fetchMovieListing{ result in
            
            // Then
            XCTAssertNil(result)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
