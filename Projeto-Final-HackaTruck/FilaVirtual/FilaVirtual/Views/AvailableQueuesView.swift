

import SwiftUI

struct AvailableQueuesView: View {
    @EnvironmentObject var queueViewModel: QueueViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var searchText = ""
    
    var filteredFilas: [Fila] {
        if searchText.isEmpty {
            return queueViewModel.filas
        } else {
            return queueViewModel.filas.filter { $0.nome.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            List(filteredFilas) { fila in
                FilaCardView(fila: fila)
            }
            .navigationTitle("Filas Disponíveis")
            .searchable(text: $searchText, prompt: "Buscar filas...")
            .onAppear {
                queueViewModel.carregarEstabelecimentos()
                // Carregar todas as filas disponíveis
                if let primeiroEstabelecimento = queueViewModel.estabelecimentos.first {
                    queueViewModel.carregarFilas(estabelecimentoId: primeiroEstabelecimento.id)
                }
            }
        }
    }
}

struct FilaCardView: View {
    let fila: Fila
    @EnvironmentObject var queueViewModel: QueueViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(fila.nome)
                        .font(.headline)
                    
                    Text(fila.preferencial ? "Fila Preferencial" : "Fila Normal")
                        .font(.caption)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                        .background(fila.preferencial ? Color.orange.opacity(0.2) : Color.blue.opacity(0.2))
                        .foregroundColor(fila.preferencial ? .orange : .blue)
                        .cornerRadius(4)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("\(fila.numProx - fila.numAtual) pessoas")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text("~\(fila.tempoMedio) min/pessoa")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            
            if let cliente = authViewModel.currentCliente {
                Button("Entrar na Fila") {
                    queueViewModel.entrarNaFila(fila: fila, cliente: cliente) { success in
                        // Mostrar feedback
                    }
                }
                .buttonStyle(BorderlessButtonStyle())
                .foregroundColor(.blue)
                .font(.subheadline)
                .fontWeight(.semibold)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
    }
}
