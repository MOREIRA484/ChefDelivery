//
//  CarouselTabView.swift
//  ChefDelivery
//
//  Created by leonardo Moreira on 31/07/23.
//

import SwiftUI

struct CarouselTabView: View {
    
    let ordersMock: [orderType] = [
    orderType(id: 1, name: "Banner burguer", image: "barbecue-banner"),
    orderType(id: 2, name: "Banner Prato feito", image: "brazilian-meal-banner"),
    orderType(id: 3, name: "Banner Poker", image: "pokes-banner")
    ]
    
    var body: some View {
        TabView {
            ForEach(ordersMock) { mock in
                CarouselView(order: mock)
                
            }
        }
        .frame(height: 180)
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

struct CarouselTabView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselTabView()
    }
}
