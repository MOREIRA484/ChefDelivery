//
//  HomeView.swift
//  ChefDelivery
//
//  Created by leonardo Moreira on 07/08/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var IsAnimating = false
    @State private var imageOffset: CGSize = .zero
    @State private var buttonOffset: CGFloat = 0
    @State private var showSecondScreen = false
    let butaoHeight: CGFloat = 80
    
    
    var body: some View {
        
        
        
        GeometryReader { GeometryReader in
            ZStack {
                
                
                //MARK: CIRCULO SUPERIOR ESQUERDO//
                
                Circle()
                    .foregroundColor(Color("ColorRed"))
                    .frame(width: IsAnimating ? 200 : 0)
                    .position(x: IsAnimating ? 50: -50, y: IsAnimating ? 100: -100)
                    .blur(radius: 60)
                    .opacity(IsAnimating ? 0.5: 0)
                
                
                
              
                //MARK: CIRCULO INFERIOR DIREITO//
                
                Circle()
                    .foregroundColor(Color("ColorRed"))
                    .frame(width: IsAnimating ? 200: 0)
                    .position(
                        x:IsAnimating ? GeometryReader.size.width - 50: GeometryReader.size.width + 50,
                        y: IsAnimating ? GeometryReader.size.height - 50 : GeometryReader.size.height + 50)
                    .blur(radius: 60)
                    .opacity(IsAnimating ? 0.5: 0)
                
                
                
                VStack{
                    
                    
                    //MARK: NOME DO APLICATIVO "CHEFE DELIVERY"//
                    
                    Text("Chef Delivery")
                        .font(.system(size: 48))
                        .fontWeight(.heavy)
                        .foregroundColor(Color("ColorRed"))
                        .padding(.top)
                        .opacity(IsAnimating ? 1: 0)
                        .offset(y: IsAnimating ? 0 : -40)
                    
                    
                //MARK: SUBTITULO.//
                    
                    Text("Peça as suas comida no conforto da sua casa.")
                        .font(.title2)
                        .padding()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black.opacity(0.6))
                        .opacity(IsAnimating ? 1: 0)
                        .offset(y: IsAnimating ? 0: -40)
                    
                    
                    //Mark: LOGO IMAGEM HAMBURGUE, BATATA E REFRIGERANTE//
                    
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 60)
                        .padding(IsAnimating ? 32: 92)
                        .opacity(IsAnimating ? 1: 0)
                        .offset(x: imageOffset.width, y: imageOffset.height)
                        .gesture(
                        DragGesture()
                            .onChanged({ gesture in
                                withAnimation(.easeInOut(duration: 0.5)) {
                                    imageOffset = gesture.translation
                                }
                                
                            })
                        
                        //mark: AQUI ESTÁ A PARTE DA ONDE INICIA E AONDE ELE VAI PARAR QUANDO SOLTA O DEDO DA TELA//
                        
                            .onEnded({ _ in
                                withAnimation(.easeInOut(duration: 0.5)) {
                                    imageOffset = .zero
                                }
                               
                            })
                        )
                    
                    //
                    ZStack{
                        
                        //MARK: PRIMEIRO RETÂNGULO //
                        
                        Capsule()
                            .fill(Color("ColorRed"))
                            .opacity(0.2)
                        
                        
                        //MARK: SEGUNDO RETÂNGULO //
                        
                        Capsule()
                            .fill(Color("ColorRed"))
                            .opacity(0.2)
                            .padding(8)
                        
                        
                        //MARK: Texto "DESCRUBRA MAIS" //
                        
                        Text("Descubra Mais")
                            .font(.title2)
                            .bold()
                            .foregroundColor(Color("ColorRedDark"))
                            .offset(x: 20)
                        
                        
                        HStack{
                            Capsule()
                                .fill(Color("ColorRed"))
                                .frame(width: buttonOffset + butaoHeight)
                            
                            Spacer()
                        }
                        
                        
                        
                        
                        HStack{
                            ZStack{
                                //MARK: CÍRCULO DO FUNDO //
                                Circle()
                                    .fill(Color("ColorRed"))
                                
                                //MARK: CÍRCULO DA FRENTE  //
                                Circle()
                                    .fill(Color("ColorRedDark"))
                                    .padding(8)
                                
                                
                            //MARK: SYSTEMNAME QUE ESTÁ DENTRO DO CÍRCULO //
                                Image(systemName: "chevron.right.2")
                                    .font(.system(size: 24))
                                    .bold()
                                    .foregroundColor(.white)
                                
                                
                            }
                            
                            Spacer()
                            
                        }
                        
                        .offset(x: buttonOffset)
                        
                        .gesture(
                        DragGesture()
                            .onChanged({ gesture in
                                
                                if gesture.translation.width >= 0 && buttonOffset <= (GeometryReader.size.width - 60) - 80 {
                                    
                                    withAnimation(.easeIn(duration: 0.25)) {
                                        
                                        buttonOffset = gesture.translation.width
                                    }
                                }
                                
                               
                                
                            })
                            .onEnded({ _ in
                                
                                if buttonOffset > (GeometryReader.size.width - 60) / 2 {
                                    showSecondScreen = true
                                } else {
                                    
                                    withAnimation(.easeInOut(duration: 0.25)) {
                                        buttonOffset = 0
                                    }
                                }
                
                            })
                        )
                        
                            
                    }
                    .frame(width: GeometryReader.size.width - 60, height: butaoHeight)
                    .opacity(IsAnimating ? 1 : 0)
                    .offset(y: IsAnimating ? 0: 100)
                }
                
                //MARK: DURAÇÃO DA ANIMAÇÃO !! //
                
                .onAppear {
                    withAnimation(.easeIn(duration: 1.5)) {
                        IsAnimating = true
                    }
                }
            }
            
            .fullScreenCover(isPresented: $showSecondScreen) {
                ContentView()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
