//
//  ContentView.swift
//  ChefDelivery
//
//  Created by leonardo Moreira on 31/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView{
            VStack{
                    NavigationBar()
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 20){
                            OrderTypeGridView()
                            CarouselTabView()
                            StoreContainerView()
                            
                        }
                    }
                }
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
