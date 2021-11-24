//
//  RestaurantRepositoryMock.swift
//  WegbringenTests
//
//  Created by Astha yadav on 23/11/21.
//

import Foundation
@testable import Wegbringen

class RestaurantRespositoryMock: RestaurantRepositoryProtocol{
    private var restaurants: [Restaurant]
    init(restaurants:[Restaurant]){
        self.restaurants = restaurants
    }
    
    func search(searchContext: SearchContext) throws -> [Restaurant] {
        return self.restaurants
    }
  
}
