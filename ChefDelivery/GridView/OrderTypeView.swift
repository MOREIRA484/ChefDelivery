//
//  OrderTypeView.swift
//  ChefDelivery
//
//  Created by leonardo Moreira on 31/07/23.
//

import SwiftUI

struct OrderTypeView: View {
    
    let orderType: orderType
    
    var body: some View {
        VStack(spacing: 5){
            Image(orderType.image)
                .resizable()
                .scaledToFit()
                .fixedSize(horizontal: false, vertical: true)
            
            Text(orderType.name)
                .font(.system(size: 10))
                .font(.footnote)
                
        }
        .frame(width: 70, height: 100)
    }
}

struct OrderTypeView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTypeView(orderType: orderType(id: 1, name: "Restaurantes", image: "hamburguer"))
            
    }
}
