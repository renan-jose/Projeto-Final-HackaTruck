

import SwiftUI

struct EntrarFilaView: View {
    
    let userName: String
    
    @State private var userID: String = ""
    
//    @StateObject private var filaService = ClienteService()
    @StateObject private var entradaService = EntradaService()
    @StateObject private var filaService = FilaService()
    @State private var idAux: String = ""
    @State private var revAux: String = ""
    @State private var preferencialAux: Bool = false
    @State private var num_proxAux: Int = 0
    @State private var nomeAux: String = ""
    @State private var num_atualAux: Int = 0
    @State private var tempo_medioAux: Int = 0
    @State private var estabelecimento_nomeAux: String = ""
    
    var body: some View {
        
        NavigationStack {
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
                        Text("Digitar Nome:")
                            .font(.custom("MontserratAlternates-Bold", size: 18))
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
                        //                        filaService.putfila()
                        
                        print(filaService.filas.count)
                        
                        entradaService.getentrada()
                        filaService.getfilas()
                        
                        
                        
                        for f in filaService.filas {
                            if userID == f.nome {
                                idAux = f._id!
                                revAux = f._rev!
                                preferencialAux = f.preferencial
                                num_proxAux = f.num_prox
                                nomeAux = f.nome
                                num_atualAux = f.num_atual
                                tempo_medioAux = f.tempo_medio
                                estabelecimento_nomeAux = f.estabelecimento_nome
                                
                                Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                                    filaService.putfila(Fila(_id: idAux, _rev: revAux, nome: nomeAux, preferencial: preferencialAux, tempo_medio: tempo_medioAux, num_prox: (num_proxAux+1), num_atual: num_atualAux, estabelecimento_nome: estabelecimento_nomeAux))
                                }
                                
                                entradaService.postentrada(Entrada(_id: nil, _rev: nil, cliente_nome: userName, fila_nome: userID, estabelecimento_nome: estabelecimento_nomeAux, num: num_proxAux))
                                
                            }
                        }
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
        .onAppear() {
            filaService.getfilas()
        }
    }
}

//#Preview {
//    EntrarFilaView()
//}
