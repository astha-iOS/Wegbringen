//
//  RestaurantTableCellViewModel.swift
//  Wegbringen
//
//  Created by Astha yadav on 19/11/21.
//

import Foundation

class RestaurantTableCellViewModel{
    
    private var restaurant: Restaurant?
    
    init(restaurant:Restaurant?){
        self.restaurant = restaurant
    }
    
    var restaurantName: String {
        guard let name = restaurant?.name else { return "" }
        return name
    }
    
    var status: String {
        switch restaurant?.status{
        case .statusOpen:
            return "Open"
        case .orderAhead:
            return "Order ahead"
        case .closed:
            return "Closed"
        default:
            return ""
        }
    }
    
    var bestMatch: String{
        guard let bestMatch = restaurant?.sortingValues.bestMatch else { return "" }
        return "Best Match: \(bestMatch)"
    }
    
    var deliveryCosts: String{
        guard let deliveryCosts = restaurant?.sortingValues.deliveryCosts else { return "" }
        return "\(deliveryCosts)"
    }
    
    var distance: String{
        guard let distance = restaurant?.sortingValues.distance else { return "" }
        return "\(distance)"
    }
    
    var minCost: String{
        guard let minCost = restaurant?.sortingValues.minCost else { return "" }
        return "\(minCost)"
    }
    
    var newest: String{
        guard let newest = restaurant?.sortingValues.newest else { return "" }
        return "Newest: \(newest)"
    }
    
    var popularity: String{
        guard let popularity = restaurant?.sortingValues.popularity else { return "" }
        return "Popularity: \(popularity)"
    }
    
    var averageProductPrice: String{
        guard let averageProductPrice = restaurant?.sortingValues.averageProductPrice else { return "" }
        return "Average Product Price: \(averageProductPrice)"
    }
    
    var ratingAverage: String{
        guard let ratingAverage = restaurant?.sortingValues.ratingAverage else { return "" }
        return "\(ratingAverage)"
    }
    

}
