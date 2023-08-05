//
//  StoreContainerView.swift
//  ChefDelivery
//
//  Created by leonardo Moreira on 31/07/23.
//

import SwiftUI

struct StoreContainerView: View {
    
    let title = "Lojas"
    @State private var ratingfilter = 0
    
    var filteredStores: [StoreType] {
        return storesMock.filter { store in
            store.stars >= ratingfilter
        }
    }
    
    var body: some View {
        VStack(alignment: .leading){
            
            HStack{
                Text(title)
                    .font(.headline)
                
                Spacer()
                
                Menu("Filtrar") {
                   
                    Button {
                        ratingfilter = 0
                    } label: {
                        Text("Limpar filtro")
                    }
                    Divider()
                    
                    ForEach(1...5, id: \.self ) { rating in
                        Button {
                            ratingfilter = rating
                        } label: {
                            if rating > 1 {
                                Text("\(rating) estrelas ou mais ")
                            } else {
                                Text("\(rating) estrela ou mais ")
                            }
                          
                        }

                    }
                }
                .foregroundColor(Color.black)
            }
            
            
            VStack(alignment: .leading,spacing: 30){
                
                
                if filteredStores.isEmpty {
                    Text("Nenhum resultado encontrado.")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color("ColorRed"))
                        .padding(.vertical, 32)
                        .frame(maxWidth: .infinity)
                } else {
                    ForEach(filteredStores) {Mock in
                        NavigationLink {
                            StoreDetailView(store: Mock)
                        } label: {
                            StoreItemView(store: Mock)
                        }
                    }
                    .foregroundColor(Color.black)
                }
            }
        }
        .padding(20)
    }
}

struct StoreContainerView_Previews: PreviewProvider {
    static var previews: some View {
        StoreContainerView()
    }
}
