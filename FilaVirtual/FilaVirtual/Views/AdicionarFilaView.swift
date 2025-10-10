import SwiftUI
import Foundation

struct AdicionarFilaView: View {
    
    @StateObject var filaService = FilaService()
    @State private var nomeFila = ""
    @State private var isPreferencial = false
    @State private var tempoMedio = 5
    @State private var showingAlert = false
    @State private var alertMessage = ""

    var body: some View {
        ZStack {
            Color.verde
                .edgesIgnoringSafeArea(.top)
            
            VStack {
                Text("Adicionar Fila")
                    .font(.custom("MontserratAlternates-Bold", size: 25))
                    .foregroundColor(.white)
                    .padding(.top, 20)
                
                Spacer()
                    .frame(height: 40)
                
                ScrollView {
                    
                    // Nome da fila
                    HStack {
                        Text("Nome:")
                            .font(.custom("MontserratAlternates-Bold", size: 20))
                            .foregroundColor(.verde)
                            .padding(.leading, 20)
                            .padding(.trailing, 10)
                        
                        TextField("Digite o nome", text: $nomeFila)
                            .frame(height: 20)
                            .padding(10)
                            .background(Color.verdeEscuro)
                            .foregroundColor(.white)
                    }
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    Spacer().frame(height: 15)
                    
                    // Fila Preferencial
                    HStack {
                        Text("Fila Preferencial")
                            .font(.custom("MontserratAlternates-Bold", size: 20))
                            .foregroundColor(.verde)
                            .padding(.leading, 10)
                        
                        Spacer()
                        
                        Toggle("", isOn: $isPreferencial)
                            .labelsHidden()
                            .toggleStyle(SwitchToggleStyle(tint: .verdeEscuro))
                    }
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    Spacer().frame(height: 15)

                    // Tempo Médio (Stepper customizado)
                    VStack(alignment: .leading) {
                        Text("Tempo Médio de Atendimento")
                            .font(.custom("MontserratAlternates-Bold", size: 20))
                            .foregroundColor(.verde)
                            .padding(.leading, 10)
                        
                        Stepper(value: $tempoMedio, in: 1...30) {
                            Text("\(tempoMedio) minutos")
                                .foregroundColor(.verde)
                        }
                        .padding(.horizontal)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    Spacer().frame(height: 30)
                    
                    // Botão Confirmar
                    Button("Criar Fila") {
                        filaService.postFila(Fila(
                            _id: nil,
                            _rev: nil,
                            nome: nomeFila,
                            preferencial: isPreferencial,
                            tempo_medio: tempoMedio,
                            num_prox: 1,
                            num_atual: 0,
                            estabelecimento_nome: "placeholder"
                        ))
                        alertMessage = "Fila '\(nomeFila)' criada com sucesso."
                        showingAlert = true
                        nomeFila = ""
                        isPreferencial = false
                        tempoMedio = 5
                    }
                    .frame(width: 350, height: 50)
                    .foregroundColor(.verde)
                    .background(nomeFila.isEmpty ? Color.white : Color.verdeEscuro)
                    .cornerRadius(15)
                    .font(.custom("MontserratAlternates-Bold", size: 20))
                    .disabled(nomeFila.isEmpty)
                }
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Fila Criada"),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

//#Preview {
    //AdicionarFilaView()
//}
