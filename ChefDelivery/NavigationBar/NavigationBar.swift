//
//  NavigationBar.swift
//  ChefDelivery
//
//  Created by leonardo Moreira on 31/07/23.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack{
            Spacer()
            
            //MARK: RUA OU ENDEREÇO
            Button {
           
            } label: {
                Text("R. vergueiro, 3185")
                    .foregroundColor(Color.black)
                    .font(.subheadline)
                    .bold()
            }
            
            Spacer()
            
            
            //MARK: NOTIFICAÇÃO DO APLICATIVO
            
            Button {
                
            } label: {
                Image(systemName: "bell.badge")
                    .font(.title3)
                    .foregroundColor(Color.red)
                    
            }
            .padding()
            
        }
        .padding()
        
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
