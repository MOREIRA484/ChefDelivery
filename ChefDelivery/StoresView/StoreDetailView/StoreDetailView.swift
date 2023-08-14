//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by leonardo Moreira on 01/08/23.
//

import SwiftUI

struct StoreDetailView: View {
    
    let store: StoreType
    
    @Environment(\.presentationMode) var presentationMode
    @State private var selectProduct: ProductType?

    var body: some View {
        
        
         ScrollView(showsIndicators: false){
             VStack(alignment: .leading){
                 
                 
                 
                 StoreDetailProductsView(product: store.products)
                 
              }
             
            }
            .navigationTitle(store.name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            
            ToolbarItem(placement: .navigationBarLeading) {
              
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack{
                        Image(systemName: "cart")
                        
                        Text("Loja")
                    }
                    .foregroundColor(Color("ColorRed"))
                }

            }
           }
        }
    }



struct StoreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailView(store: storesMock[0])
    }
}
