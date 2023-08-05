//
//  CarouselView.swift
//  ChefDelivery
//
//  Created by leonardo Moreira on 31/07/23.
//

import SwiftUI

struct CarouselView: View {
    let order: orderType
    
    var body: some View {
        Image(order.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView(order: orderType(id: 1, name: "", image: "barbecue-banner"))
            .padding()
    }
}
