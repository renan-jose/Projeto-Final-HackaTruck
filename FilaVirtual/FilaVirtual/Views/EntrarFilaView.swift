

import SwiftUI

struct EntrarFilaView: View {
    @State private var userID: String = ""
    
    var body: some View {
        ZStack {
            Color.verde
                .edgesIgnoringSafeArea(.top)
            
            VStack {
                Text("Entrar na Fila")
                    .font(.custom("MontserratAlternates-Bold", size: 25))
                    .foregroundColor(.white)
                
                Spacer()
                
                HStack{
                    Button(action: {
                        print("Escanear QR Code")
                    }) {
                        HStack(spacing: 12) {
                            Image(systemName: "qrcode.viewfinder")
                                .font(.title3)
                            
                            Text("Escanear QR Code")
                            
                            Image(systemName: "qrcode.viewfinder")
                                .font(.title3)
                        }
                        .foregroundColor(.verde)
                    }
                    .frame(width: 350, height: 60)
                    .background(Color.white)
                    .foregroundColor(.white)
                    .font(.custom("MontserratAlternates-Bold", size: 25))
                    .cornerRadius(15)
                    .padding(.top, 8)
                }
                
                Spacer()
                    .frame(height: 20)
                
                HStack {
                    Rectangle()
                        .frame(width: 150, height: 2)
                        .foregroundStyle(.white)
                    
                    Text("OU")
                        .font(.custom("BebasNeue-Regular", size: 20))
                        .foregroundStyle(.white)
                    
                    Rectangle()
                        .frame(width: 150, height: 2)
                        .foregroundStyle(.white)
                }
                
                Spacer()
                    .frame(height: 20)
                
                HStack {
                    Text("Digitar ID:")
                        .font(.custom("MontserratAlternates-Bold", size: 20))
                        .foregroundColor(.verde)
                        .padding(.leading, 20)
                        .padding(.trailing, 10)
                            
                    TextField("", text: $userID)
                        .frame(height: 30)
                        .padding(10)
                        .background(.verdeEscuro)
                        .cornerRadius(8)
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
    EntrarFilaView()
}
