//
//  ColocarSenhaView.swift
//  FilaVirtual
//
//  Created by Turma01-16 on 08/10/25.
//

import SwiftUI

struct ColocarSenhaView: View {
    @State private var senha: String = ""
    
    var body: some View {
        ZStack {
            Color.verde
                .edgesIgnoringSafeArea(.top)
            
            VStack {
                Text("Entrar na Fila")
                    .font(.custom("MontserratAlternates-Bold", size: 25))
                    .foregroundColor(.white)
                
                Spacer()
                
                ZStack {
                    Rectangle()
                        .frame(width: 350, height: 250)
                        .cornerRadius(10)
                        .foregroundStyle(.white)
                    
                    VStack{
                        Text("Fila RU")
                            .font(.custom("MontserratAlternates-Bold", size: 30))
                            .foregroundStyle(.verde)
                        Spacer()
                            .frame(height: 30)
                        HStack {
                            VStack {
                                Image(systemName: "person.2.fill")
                                    .foregroundColor(.verde)
                                
                                Spacer()
                                    .frame(height: 10)
                                
                                Image(systemName: "clock")
                                    .foregroundColor(.verde)
                                
                                Spacer()
                                    .frame(height: 10)
                                
                                Image(systemName: "figure.roll")
                                    .foregroundColor(.verde)
                                
                                Spacer()
                                    .frame(height: 10)
                                
                                Image(systemName: "touchid")
                                    .foregroundColor(.verde)
                            }
                            
                            VStack (alignment: .leading) {
                                Text("Membros:")
                                    .foregroundStyle(.verde)
                                    .font(.custom("Montserrat-Bold", size: 20))
                                
                                Spacer()
                                    .frame(height: 5)
                                
                                Text("Tempo:")
                                    .foregroundStyle(.verde)
                                    .font(.custom("Montserrat-Bold", size: 20))
                                
                                Spacer()
                                    .frame(height: 5)
                                
                                Text("Preferencial:")
                                    .foregroundStyle(.verde)
                                    .font(.custom("Montserrat-Bold", size: 20))
                                
                                Spacer()
                                    .frame(height: 5)
                                
                                Text("ID:")
                                    .foregroundStyle(.verde)
                                    .font(.custom("Montserrat-Bold", size: 20))
                            }
                            
                            Spacer()
                                .frame(width: 50)
                            
                            VStack (alignment: .trailing) {
                                Text("157")
                                    .foregroundStyle(.verde)
                                    .font(.custom("Montserrat-Regular", size: 20))
                                
                                Spacer()
                                    .frame(height: 5)
                                
                                Text("32 min")
                                    .foregroundStyle(.verde)
                                    .font(.custom("Montserrat-Regular", size: 20))
                                
                                Spacer()
                                    .frame(height: 5)
                                
                                Text("Sim")
                                    .foregroundStyle(.verde)
                                    .font(.custom("Montserrat-Regular", size: 20))
                                
                                Spacer()
                                    .frame(height: 5)
                                
                                Text("ShgS76b")
                                    .foregroundStyle(.verde)
                                    .font(.custom("Montserrat-Regular", size: 20))
                            }
                        }
                    }
                }
                
                Spacer()
                    .frame(height: 50)
                
                HStack {
                    Text("Senha:")
                        .font(.custom("MontserratAlternates-Bold", size: 20))
                        .foregroundColor(.verde)
                        .padding(.leading, 20)
                        .padding(.trailing, 10)
                            
                    TextField("", text: $senha)
                        .frame(height: 30)
                        .padding(10)
                        .background(.verdeEscuro)
                        .cornerRadius(10)
                        .foregroundColor(.white)

                        }

                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal)
                .background(Color.green)
                
                Spacer()
                    .frame(height: 20)
                
                Button("Confirmar"){
                    
                }
                .frame(width: 350, height: 50)
                .foregroundColor(.white)
                .font(.custom("MontserratAlternates-Bold", size: 25))
                .cornerRadius(15)
                .overlay(RoundedRectangle(cornerRadius: 15)
                    .stroke(.white, lineWidth: 2)
                )

                Spacer()
            }
        }
    }
}

#Preview {
    ColocarSenhaView()
}
