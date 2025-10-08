


import SwiftUI

struct ProviderQueuesView: View {
    @EnvironmentObject var queueViewModel: QueueViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            Group {
                if queueViewModel.isLoading {
                    ProgressView("Carregando filas...")
                } else if queueViewModel.filas.isEmpty {
                    VStack(spacing: 20) {
                        Image(systemName: "list.bullet.clipboard")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                        Text("Nenhuma fila criada")
                            .font(.title2)
                            .foregroundColor(.gray)
                        NavigationLink("Criar Primeira Fila") {
                            CreateQueueView()
                        }
                    }
                } else {
                    List(queueViewModel.filas) { fila in
                        ProviderFilaCardView(fila: fila)
                    }
                }
            }
            .navigationTitle("Minhas Filas")
            .refreshable {
                if let estabelecimento = authViewModel.currentEstabelecimento {
                    queueViewModel.carregarFilas(estabelecimentoId: estabelecimento.id)
                }
            }
        }
    }
}

struct ProviderFilaCardView: View {
    let fila: Fila
    @EnvironmentObject var queueViewModel: QueueViewModel
    
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
                    Text("Próximo: \(fila.numProx)")
                        .font(.subheadline)
                    
                    Text("Atual: \(fila.numAtual)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            
            Text("\(fila.numProx - fila.numAtual) pessoas na fila")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            HStack {
                Button("Chamar Próximo") {
                    queueViewModel.avancarFila(fila: fila) { success in
                        // Feedback
                    }
                }
                .buttonStyle(BorderlessButtonStyle())
                .foregroundColor(.green)
                .fontWeight(.semibold)
                
                Spacer()
                
                Button("Editar") {
                    // Abrir edição
                }
                .buttonStyle(BorderlessButtonStyle())
                .foregroundColor(.blue)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
    }
}
