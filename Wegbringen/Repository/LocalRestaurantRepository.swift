//
//  RestaurantRepository.swift
//  Wegbringen
//
//  Created by Astha yadav on 19/11/21.
//

import Foundation
import os

protocol RestaurantRepositoryProtocol{
    func search(searchContext: SearchContext) throws->[Restaurant]
}

class LocalRestaurantRepository: RestaurantRepositoryProtocol{
    
    private static let restaurants:[Restaurant] = { () -> [Restaurant] in
        guard let url = Bundle.main.url(forResource: File.fileName, withExtension: File.fileExtension) else {
            os_log("FAIL: couldn't find %@ JSON data on main bundle",log: Log.fileSyatem, type: .error, File.fileName)
            return []
        }
        do {
            let resturantData = try Data.init(contentsOf: url)
            return try JsonParser.convert(data: resturantData, type:Response.self)?.restaurants ?? []
        }catch{
            os_log("%@",log: Log.fileSyatem, type: .error, error.localizedDescription)
        }
        return []
    }()
    
    func search(searchContext: SearchContext) throws-> [Restaurant]{
        return LocalRestaurantRepository.restaurants
    }
}

