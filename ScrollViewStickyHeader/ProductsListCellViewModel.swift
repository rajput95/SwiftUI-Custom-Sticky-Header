//
//  ProductsListCellViewModel.swift
//  ScrollViewStickyHeader
//
//  Created by Moin Rajput on 15/05/2021.
//

import Foundation

class ProductsListCellViewModel {
    let name: String
    let price: String?
    let image: String
    
    init(name: String, price: String? = nil, image: String) {
        self.name = name
        self.price = price
        self.image = image
    }
}
