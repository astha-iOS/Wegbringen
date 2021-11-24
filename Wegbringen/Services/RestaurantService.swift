//
//  LocalServices.swift
//  Wegbringen
//
//  Created by Astha yadav on 18/11/21.
//

import Foundation
import os

typealias ComplitionBlock = ([Restaurant]?, Error?) -> Void

class RestaurantService {
    private var restaurantRepository:RestaurantRepositoryProtocol
    
    init(restaurantRepository:RestaurantRepositoryProtocol){
        self.restaurantRepository=restaurantRepository
    }
    
    func getRestaurants(searchContext:SearchContext, completion: @escaping ComplitionBlock) {
        do{
            let restaurants =  try self.restaurantRepository.search(searchContext: searchContext)
            let filteredRestaurants = filterByName(restaurants: restaurants, searchContext: searchContext)
            var sortRestaurants = sortRestaurant(restaurant: filteredRestaurants, sortContext: searchContext)
            sortRestaurants = sortRestaurants?.sorted(by: {$0.status < $1.status})
            completion(sortRestaurants,nil)
        }
        catch {
            completion([],error)
        }
    }
    
    func filterByName(restaurants:[Restaurant], searchContext: SearchContext)->[Restaurant]{
        if !(searchContext.getFilterBy().trimmingCharacters(in: .whitespaces).isEmpty){
            return restaurants.filter { $0.name.lowercased().contains(searchContext.getFilterBy().lowercased()) }
        }
        return restaurants
    }
    
    func sortRestaurant(restaurant:[Restaurant], sortContext:SearchContext) -> [Restaurant]?{
        switch sortContext.getSortBy(){
        case SortList.bestMatch.description:
            return restaurant.sorted(by: {$0.sortingValues.bestMatch > $1.sortingValues.bestMatch})
        case SortList.newest.description:
            return restaurant.sorted(by: {$0.sortingValues.newest > $1.sortingValues.newest})
        case SortList.ratingAverage.description:
            return restaurant.sorted(by: {$0.sortingValues.ratingAverage > $1.sortingValues.ratingAverage})
        case SortList.distance.description:
            return restaurant.sorted(by: {$0.sortingValues.distance < $1.sortingValues.distance})
        case SortList.popularity.description:
            return restaurant.sorted(by: {$0.sortingValues.popularity > $1.sortingValues.popularity})
        case SortList.averageProductPrice.description:
            return restaurant.sorted(by: {$0.sortingValues.averageProductPrice < $1.sortingValues.averageProductPrice})
        case SortList.deliveryCosts.description:
            return restaurant.sorted(by: {$0.sortingValues.deliveryCosts < $1.sortingValues.deliveryCosts})
        case SortList.minCost.description:
            return restaurant.sorted(by: {$0.sortingValues.minCost < $1.sortingValues.minCost})
        default:
            os_log("Filter by %@ not supproted",log: Log.app, type: .debug, sortContext.getSortBy())
            return restaurant.sorted(by: {$0.sortingValues.bestMatch > $1.sortingValues.bestMatch})
        }
    }
}
