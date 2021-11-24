//
//  ParseRestaurants.swift
//  Wegbringen
//
//  Created by Astha yadav on 19/11/21.
//

import Foundation


class JsonParser{
    static let decoder = JSONDecoder()
    static func convert<T: Decodable> (data:Data, type: T.Type) throws -> T? {
        do {
            return try decoder.decode(type, from: data)
        }
    }
}
