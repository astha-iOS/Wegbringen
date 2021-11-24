//
//  AppError.swift
//  Wegbringen
//
//  Created by Astha yadav on 19/11/21.
//

import Foundation

enum AppError: Error {
    
    case fileNotFound
    case custom(message: String)
    
    var ErrorMessage: String {
        switch self {
        case .fileNotFound:
            return "File Not Found"
        case .custom(let message):
            return message
        }
    }
}
