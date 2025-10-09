//
//  LoginClienteView.swift
//  FilaVirtual
//
//  Created by Turma01-16 on 09/10/25.
//

import SwiftUI

struct LoginClienteView: View {
    @State private var nome: String = ""
    @State private var isOn = false
    
    var body: some View {
        ZStack {
            Color.verde
                .edgesIgnoringSafeArea(.all)
            
            VStack() {
                Image("QueueWe_LogoFinal")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(0.8)
                    .padding(.top, 60)
                
                Spacer()
                
                HStack {
                    Text("Nome:")
                        .font(.custom("MontserratAlternates-Bold", size: 20))
                        .foregroundColor(.verde)
                        .padding(.leading, 20)
                        .padding(.trailing, 10)
                    
                    TextField("", text: $nome)
                        .frame(height: 30)
                        .padding(10)
                        .background(Color.verdeEscuro)
                        .foregroundColor(.white)
                }
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal)

                HStack {
                    Text("Preferência")
                        .font(.custom("MontserratAlternates-Bold", size: 20))
                        .foregroundColor(.verde)
                    
                    Spacer()
                        .frame(height: 20)
                    
                    Toggle("", isOn: $isOn)
                        .labelsHidden()
                        .toggleStyle(SwitchToggleStyle(tint: .verdeEscuro))
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal)
                
                Button("Confirmar") {

                }
                .frame(width: 350, height: 50)
                .foregroundColor(.white)
                .font(.custom("MontserratAlternates-Bold", size: 25))
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.white, lineWidth: 2)
                )
                .padding(.top, 20)

                Spacer()
            }
            .padding(.bottom, 40)
        }
    }
}

#Preview {
    LoginClienteView()
}
