

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject private var queueViewModel = QueueViewModel()
    
    var body: some View {
        TabView {
            if authViewModel.currentUserType == .client {
                // Cliente Views
                ClientQueueView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Minhas Filas")
                    }
                
                AvailableQueuesView()
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("Filas Disponíveis")
                    }
            } else {
                // Provider Views
                ProviderQueuesView()
                    .tabItem {
                        Image(systemName: "chart.bar.doc.horizontal")
                        Text("Minhas Filas")
                    }
                
                CreateQueueView()
                    .tabItem {
                        Image(systemName: "plus.circle.fill")
                        Text("Nova Fila")
                    }
            }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle.fill")
                    Text("Perfil")
                }
        }
        .environmentObject(queueViewModel)
        .onAppear {
            setupInitialData()
        }
    }
    
    private func setupInitialData() {
        if authViewModel.currentUserType == .client {
            if let cliente = authViewModel.currentCliente {
                queueViewModel.carregarMinhasFilas(clienteId: cliente.id)
            }
        } else {
            if let estabelecimento = authViewModel.currentEstabelecimento {
                queueViewModel.carregarFilas(estabelecimentoId: estabelecimento.id)
            }
        }
        queueViewModel.carregarEstabelecimentos()
        queueViewModel.carregarClientes()
    }
}
