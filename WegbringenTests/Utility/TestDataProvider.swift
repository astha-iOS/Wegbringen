//
//  TestDataProvider.swift
//  WegbringenTests
//
//  Created by Astha yadav on 23/11/21.
//

import Foundation
@testable import Wegbringen

class TestDataProvider{
    static func buildResturantList()->[Restaurant]{
        return [
            Restaurant(name: "Tanoshii Sushi", status:Status.statusOpen , sortingValues: SortingValues(bestMatch: 10.0, newest: 11.0, ratingAverage: 4.5, distance: 50, popularity: 25.0, averageProductPrice: 3, deliveryCosts: 1, minCost: 5)),
            Restaurant(name: "Royal Thai", status:Status.orderAhead , sortingValues: SortingValues(bestMatch: 9.0, newest: 12.0, ratingAverage: 3.5, distance: 20, popularity: 20.0, averageProductPrice: 3, deliveryCosts: 1, minCost: 5)),
            Restaurant(name: "Sushi One", status:Status.closed , sortingValues: SortingValues(bestMatch: 15.0, newest: 13.0, ratingAverage: 2.5, distance: 25, popularity: 21.0, averageProductPrice: 3, deliveryCosts: 1, minCost: 5)),
            Restaurant(name: "Aarti 2", status:Status.statusOpen , sortingValues: SortingValues(bestMatch: 8.0, newest: 14.0, ratingAverage: 3.0, distance: 40, popularity: 20.5, averageProductPrice: 3, deliveryCosts: 1, minCost: 5)),
            Restaurant(name: "Roti Shop", status:Status.statusOpen , sortingValues: SortingValues(bestMatch: 10.0, newest: 15.0, ratingAverage: 4.5, distance: 55, popularity: 18.9, averageProductPrice: 3, deliveryCosts: 1, minCost: 5))
        ]
    }
    
    
}
