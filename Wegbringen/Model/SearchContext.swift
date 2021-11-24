//
//  SearchModel.swift
//  Wegbringen
//
//  Created by Astha yadav on 19/11/21.
//

import Foundation

struct SearchContext{
    private var sortBy: String
    private var filterBy: String
    
    init(sortBy: String, filterBy: String){
        self.sortBy = sortBy
        self.filterBy = filterBy
    }
    
    public func getSortBy()->String{
        return sortBy
    }
    
    public func getFilterBy()->String{
        return filterBy
    }
}

