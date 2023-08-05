//
//  StoreDetailProductsView.swift
//  ChefDelivery
//
//  Created by leonardo Moreira on 03/08/23.
//

import SwiftUI

struct StoreDetailProductsView: View {
    
    let product: [ProductType]
    @State private var selectProduct: ProductType?
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Produtos")
                .font(.title2)
                .bold()
                .padding()
            
            
        //MARK: LISTA DE PRODUTOS
            
            ForEach(product) { product in
                
                Button {
                    selectProduct = product
                } label: {
                    StoreDetailProductItemView(product: product)
                }
                .sheet(item: $selectProduct) { product in
                    ProductDetailView(product: product)
                }
            }
        }
    }
}

struct StoreDetailProductsView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailProductsView(product: storesMock[0].products)
    }
}
