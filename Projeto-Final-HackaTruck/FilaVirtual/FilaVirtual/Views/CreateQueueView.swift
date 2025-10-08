

import SwiftUI

struct CreateQueueView: View {
    @EnvironmentObject var queueViewModel: QueueViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var nomeFila = ""
    @State private var isPreferencial = false
    @State private var tempoMedio = 5
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Informações da Fila")) {
                    TextField("Nome da Fila", text: $nomeFila)
                    
                    Toggle("Fila Preferencial", isOn: $isPreferencial)
                    
                    Stepper("Tempo Médio: \(tempoMedio) min", value: $tempoMedio, in: 1...30)
                }
                
                Section {
                    Button("Criar Fila") {
                        criarFila()
                    }
                    .disabled(nomeFila.isEmpty)
                }
            }
            .navigationTitle("Nova Fila")
            .alert("Fila Criada", isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    private func criarFila() {
        guard let estabelecimento = authViewModel.currentEstabelecimento else { return }
        
        queueViewModel.criarFila(
            nome: nomeFila,
            preferencial: isPreferencial,
            tempoMedio: tempoMedio,
            estabelecimentoId: estabelecimento.id
        ) { success in
            if success {
                alertMessage = "Fila '\(nomeFila)' criada com sucesso!"
                nomeFila = ""
                isPreferencial = false
                tempoMedio = 5
            } else {
                alertMessage = "Erro ao criar fila. Tente novamente."
            }
            showingAlert = true
        }
    }
}
