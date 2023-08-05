//
//  StoreDetailProductItemView.swift
//  ChefDelivery
//
//  Created by leonardo Moreira on 03/08/23.
//

import SwiftUI

struct StoreDetailProductItemView: View {
    let product: ProductType
    
    var body: some View {
        
        HStack(spacing: 8){
            VStack(alignment: .leading, spacing: 8){
                Text(product.name)
                    .bold()
                
                Text(product.description)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                
                Text("\(product.formattedPrice)")
            }
            
            Spacer()
            
            Image(product.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(12)
                .frame(width: 120, height: 120)
                .shadow(color: .black.opacity(0.3), radius: 20, x: 6, y: 8)
        }
        .padding()
        .foregroundColor(Color.black)
    }
}

struct StoreDetailProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailProductItemView(product: storesMock[0].products[0])
    }
}
