//
//  RestaurantStatus.swift
//  Wegbringen
//
//  Created by Astha yadav on 20/11/21.
//

import Foundation

public enum RestaurantStatus: Int {
    case unknown = 0
    case closed = 1
    case orderAhead = 2
    case open = 3
    
    init(string: String) {
        switch string.lowercased() {
        case "open"        : self = RestaurantStatus.open
        case "order ahead" : self = RestaurantStatus.orderAhead
        case "closed"      : self = RestaurantStatus.closed
        default            : self = RestaurantStatus.unknown
        }
    }
    
    public func toString() -> String {
        switch self {
        case .open      : return "Open"
        case .orderAhead: return "Order ahead"
        case .closed    : return "Closed"
        case .unknown   : return "Unknown"
        }
    }
}
