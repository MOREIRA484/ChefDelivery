//
//  CarouselTabView.swift
//  ChefDelivery
//
//  Created by leonardo Moreira on 31/07/23.
//

import SwiftUI

struct CarouselTabView: View {
    
    @State private var currentIndex = 1
    
    
    
    let ordersMock: [orderType] = [
    orderType(id: 1, name: "Banner burguer", image: "barbecue-banner"),
    orderType(id: 2, name: "Banner Prato feito", image: "brazilian-meal-banner"),
    orderType(id: 3, name: "Banner Poker", image: "pokes-banner")
    ]
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(ordersMock) { mock in
                CarouselView(order: mock)
                    .tag(mock.id)
                
            }
        }
        .frame(height: 180)
        .tabViewStyle(.page(indexDisplayMode: .always))
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
                
                withAnimation(.easeOut(duration: 1)) {
                    if currentIndex > ordersMock.count {
                        currentIndex = 1
                    }
                    
                    currentIndex += 1
                }
                
               
            }
        }
    }
}

struct CarouselTabView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselTabView()
    }
}
