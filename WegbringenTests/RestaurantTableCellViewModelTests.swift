//
//  RestaurantViewModelTests.swift
//  WegbringenTests
//
//  Created by Astha yadav on 22/11/21.
//

import XCTest
@testable import Wegbringen

class RestaurantViewModelTests: XCTestCase {

    private var sut: RestaurantTableCellViewModel!
    private var restaurantService: RestaurantService!
    private var restaurantRepoMock: RestaurantRepositoryProtocol!
    private var restaurants = [Restaurant]()

    override func setUp() {
        
        self.restaurantRepoMock = RestaurantRespositoryMock(restaurants:TestDataProvider.buildResturantList())
        self.restaurantService = RestaurantService(restaurantRepository: restaurantRepoMock)
        let search = SearchContext(sortBy: "", filterBy: "Sushi")
        self.restaurantService.getRestaurants(searchContext: search){(result,error) in
            self.restaurants = result ?? []
        }
        self.sut = RestaurantTableCellViewModel(restaurant: self.restaurants[0])
    }
    
    func test_BasicCellConfiguration() {
        XCTAssertEqual(self.sut.restaurantName, "Tanoshii Sushi")
        XCTAssertEqual(self.sut.status, "Open")
        XCTAssertEqual(self.sut.bestMatch, "Best Match: 10.0")
        XCTAssertEqual(self.sut.deliveryCosts, "1")
        XCTAssertEqual(self.sut.distance, "50")
        XCTAssertEqual(self.sut.newest, "Newest: 11.0")
        XCTAssertEqual(self.sut.averageProductPrice, "Average Product Price: 3")
        XCTAssertEqual(self.sut.ratingAverage, "4.5")
        XCTAssertEqual(self.sut.popularity, "Popularity: 25.0")
        XCTAssertEqual(self.sut.minCost, "5")

    }

}
