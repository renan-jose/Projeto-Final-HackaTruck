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
//        NavigationView {
            Form {
                Section(header: Text("Informações da Fila")) {
                    TextField("Nome da Fila", text: $nomeFila)
                    Toggle("Fila Preferencial", isOn: $isPreferencial)
                    Stepper("Tempo Médio: \(tempoMedio) min", value: $tempoMedio, in: 1...30)
                }

                Section {
                    Button("Criar Fila") {
                        filaService.postFila(Fila(_id: nil, _rev: nil, nome: nomeFila, preferencial: isPreferencial, tempo_medio: tempoMedio, num_prox: 1, num_atual: 0, estabelecimento_nome: "placeholder"))
                    }
                    .disabled(nomeFila.isEmpty)
                }
            }
            .navigationTitle("Nova Fila")
            .alert(isPresented: $showingAlert) {
                Alert(
                    title: Text("Fila Criada"),
                    message: Text(alertMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
//        }
    }
}

//#Preview {
//    AdicionarFilaView()
//}
