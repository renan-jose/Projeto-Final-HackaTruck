

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                if let userType = authViewModel.currentUserType {
                    VStack(spacing: 12) {
                        Image(systemName: userType == .client ? "person.circle.fill" : "building.2.crop.circle.fill")
                            .font(.system(size: 80))
                            .foregroundColor(.blue)
                        
                        Text(userType == .client ? "CLIENTE" : "ESTABELECIMENTO")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        if userType == .client, let cliente = authViewModel.currentCliente {
                            Text(cliente.nome)
                                .font(.title3)
                        } else if let estabelecimento = authViewModel.currentEstabelecimento {
                            Text(estabelecimento.nome)
                                .font(.title3)
                        }
                    }
                    .padding()
                }
                
                Spacer()
                
                Button("Sair") {
                    authViewModel.logout()
                }
                .foregroundColor(.red)
                .padding()
            }
            .navigationTitle("Perfil")
        }
    }
}
