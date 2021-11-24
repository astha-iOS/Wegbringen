//
//  Constants.swift
//  Wegbringen
//
//  Created by Astha yadav on 18/11/21.
//

import Foundation

/// Holds constants for Cell identifiers
enum Identifiers {
    static let restuarantTableViewCell = "RestaurantTableViewCell"
}

/// Holder Local services file_name and file_extension
enum File {
    static let fileName = "restaurant"
    static let fileExtension = "json"
}


enum SortList : String {
    case bestMatch = "Best Match", newest = "Newest", ratingAverage = "Rating Avarage", distance = "Distance", popularity = "Popularity", averageProductPrice = "Average Product Price", deliveryCosts = "Delivery Cost", minCost = "Min Cost"

     static let allValues = [bestMatch, newest, ratingAverage, distance, popularity, averageProductPrice, deliveryCosts, minCost]
    
    public var description: String {
        return name
    }
    
    private var name: String {
        switch self {
        case .bestMatch:
            return "bestMatch"
        case .newest:
            return "newest"
        case .ratingAverage:
            return "ratingAverage"
        case .distance:
            return "distance"
        case .popularity:
            return "popularity"
        case .averageProductPrice:
            return "averageProductPrice"
        case .deliveryCosts:
            return "deliveryCosts"
        case .minCost:
            return "minCost"
        }
    }
}
