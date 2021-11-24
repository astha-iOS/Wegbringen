//
//  RestaurantViewModel.swift
//  Wegbringen
//
//  Created by Astha yadav on 18/11/21.
//

import Foundation

protocol RestaurantViewModelProtocol: AnyObject{
    func didSuccess(restaurants: [Restaurant])
    func didFailure(error: String)
}

class RestaurantViewModel{
    private var restaurantService: RestaurantService!
    private var restaurantRepository: LocalRestaurantRepository!
    private var delegate: RestaurantViewModelProtocol?
    
    init(delegate: RestaurantViewModelProtocol) {
        self.delegate = delegate
        self.restaurantRepository = LocalRestaurantRepository()
        restaurantService = RestaurantService(restaurantRepository: self.restaurantRepository)
    }
    
    func getRestuarentList(filterBy: String, sortBy: String) {
        let searchContext = SearchContext(sortBy: sortBy, filterBy: filterBy);
        restaurantService.getRestaurants(searchContext: searchContext){(result,error) in
            if error != nil{
                self.delegate?.didFailure(error:error?.localizedDescription ?? "Error")
            }
            guard let result = result else { return }
            self.delegate?.didSuccess(restaurants: result)
        }
    }
}
