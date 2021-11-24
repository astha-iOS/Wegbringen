//
//  RestaurantServiceUnitTests.swift
//  WegbringenTests
//
//  Created by Astha yadav on 23/11/21.
//

import XCTest
@testable import Wegbringen

class RestaurantServiceUnitTests: XCTestCase {

    private var sut: RestaurantService!
    private var restaurantRepoMock: RestaurantRepositoryProtocol!
    
    override func setUp() {
        super.setUp()
    }
    
    func testFilterByName(){
        //given
        self.restaurantRepoMock = RestaurantRespositoryMock(restaurants:TestDataProvider.buildResturantList())
        self.sut = RestaurantService(restaurantRepository: restaurantRepoMock)
        let search = SearchContext(sortBy: "", filterBy: "Sushi")
        //when
        self.sut.getRestaurants(searchContext: search){(result,error) in
            //then
            XCTAssertNotNil(result)
            XCTAssertEqual(result?.count, 2)
            for item in result!{
                XCTAssertTrue(item.name.contains("Sushi"))
            }
        }
    }
    
    func testFilterByNameCaseInsensitive(){
        //given
        self.restaurantRepoMock = RestaurantRespositoryMock(restaurants:TestDataProvider.buildResturantList())
        self.sut = RestaurantService(restaurantRepository: restaurantRepoMock)
        let search = SearchContext(sortBy: "", filterBy: "sushi")
        //when
        self.sut.getRestaurants(searchContext: search){(result,error) in
            //then
            XCTAssertNotNil(result)
            XCTAssertEqual(result?.count, 2)
            for item in result!{
                XCTAssertTrue(item.name.contains("Sushi"))
            }
        }
    }
    
    func testFilterByEmptyFilter(){
        //given
        self.restaurantRepoMock = RestaurantRespositoryMock(restaurants:TestDataProvider.buildResturantList())
        self.sut = RestaurantService(restaurantRepository: restaurantRepoMock)
        let search = SearchContext(sortBy: "", filterBy: "")
        //when
        self.sut.getRestaurants(searchContext: search){(result,error) in
            //then
            XCTAssertNotNil(result)
            XCTAssertEqual(result?.count, 5)
        }
    }
    
    func testResturantSortByStatusByDefault(){
        //given
        let restaurants = TestDataProvider.buildResturantList()
        self.restaurantRepoMock = RestaurantRespositoryMock(restaurants:restaurants)
        self.sut = RestaurantService(restaurantRepository: restaurantRepoMock)
        let search = SearchContext(sortBy: "", filterBy: "")
        //when
        self.sut.getRestaurants(searchContext: search){(result,error) in
            //then
            XCTAssertNotNil(result)
            XCTAssertTrue(result![0] == restaurants[0])
            XCTAssertTrue(result![1] == restaurants[4])
            XCTAssertTrue(result![2] == restaurants[3])
            XCTAssertTrue(result![3] == restaurants[1])
            XCTAssertTrue(result![4] == restaurants[2])
        }
    }
    
    func testResturantSortByDistance(){
        //given
        let restaurants = TestDataProvider.buildResturantList()
        self.restaurantRepoMock = RestaurantRespositoryMock(restaurants:restaurants)
        self.sut = RestaurantService(restaurantRepository: restaurantRepoMock)
        let search = SearchContext(sortBy: "distance", filterBy: "")
        //when
        self.sut.getRestaurants(searchContext: search){(result,error) in
            //then
            XCTAssertTrue(result![1] == restaurants[0])
            XCTAssertTrue(result![3] == restaurants[1])
            XCTAssertTrue(result![4] == restaurants[2])
            XCTAssertTrue(result![0] == restaurants[3])
            XCTAssertTrue(result![2] == restaurants[4])
        }
    }
}


