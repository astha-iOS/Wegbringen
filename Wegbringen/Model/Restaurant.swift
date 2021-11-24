//
//  Restaurant.swift
//  Wegbringen
//
//  Created by Astha yadav on 18/11/21.
//

import Foundation

// MARK: - Response
struct Response: Codable {
    let restaurants: [Restaurant]
}

// MARK: - Restaurant
struct Restaurant: Codable, Equatable {
    static func == (lhs: Restaurant, rhs: Restaurant) -> Bool {
       return lhs.name == rhs.name
        && lhs.status == rhs.status
        && lhs.sortingValues == rhs.sortingValues
    }
    
    let name: String
    let status: Status
    let sortingValues: SortingValues
}

// MARK: - SortingValues
struct SortingValues: Codable, Equatable {
    let bestMatch: Double
    let newest: Double
    let ratingAverage: Double
    let distance: Int
    let popularity: Double
    let averageProductPrice: Int
    let deliveryCosts: Int
    let minCost: Int
    
}

enum Status: String, Codable,Comparable {
    case closed = "closed"
    case orderAhead = "order ahead"
    case statusOpen = "open"
    
    private var sortOrder: Int {
        switch self {
            case .statusOpen:
                return 0
            case .orderAhead:
                return 1
            case .closed:
                return 2
        }
    }

     static func ==(lhs: Status, rhs: Status) -> Bool {
        return lhs.sortOrder == rhs.sortOrder
    }

    static func <(lhs: Status, rhs: Status) -> Bool {
       return lhs.sortOrder < rhs.sortOrder
    }
}
