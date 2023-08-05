//
//  productType.swift
//  ChefDelivery
//
//  Created by leonardo Moreira on 01/08/23.
//

import Foundation


struct ProductType: Identifiable {
    
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double
    
    
    var formattedPrice: String {
        return "R$" + price.formatPrice()
    }
}
