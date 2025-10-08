

import SwiftUI

struct ClientQueueView: View {
    @EnvironmentObject var queueViewModel: QueueViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            Group {
                if queueViewModel.isLoading {
                    ProgressView("Carregando suas filas...")
                } else if queueViewModel.entradas.isEmpty {
                    VStack(spacing: 20) {
                        Image(systemName: "person.2.slash")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                        Text("Você não está em nenhuma fila")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                } else {
                    List {
                        ForEach(queueViewModel.entradas) { entrada in
                            EntradaCardView(entrada: entrada)
                        }
                    }
                }
            }
            .navigationTitle("Minhas Filas")
            .refreshable {
                if let cliente = authViewModel.currentCliente {
                    queueViewModel.carregarMinhasFilas(clienteId: cliente.id)
                }
            }
        }
    }
}

struct EntradaCardView: View {
    let entrada: Entrada
    @EnvironmentObject var queueViewModel: QueueViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Fila #\(entrada.filaId.prefix(8))")
                    .font(.headline)
                
                Spacer()
                
                Text("Nº \(entrada.num)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
            }
            
            Text("Entrou em: \(formatDate(entrada.timestamp))")
                .font(.caption)
                .foregroundColor(.gray)
            
            Button("Sair da Fila") {
                queueViewModel.sairDaFila(entrada: entrada) { success in
                    // Feedback para o usuário
                }
            }
            .buttonStyle(BorderlessButtonStyle())
            .foregroundColor(.red)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 2)
    }
    
    private func formatDate(_ dateString: String) -> String {
        let formatter = ISO8601DateFormatter()
        guard let date = formatter.date(from: dateString) else { return dateString }
        
        let displayFormatter = DateFormatter()
        displayFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        return displayFormatter.string(from: date)
    }
}
