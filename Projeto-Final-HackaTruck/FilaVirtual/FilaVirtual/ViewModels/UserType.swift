

import Foundation

enum UserType {
    case client
    case provider
}

class AuthViewModel: ObservableObject {
    @Published var currentUserType: UserType?
    @Published var currentEstabelecimento: Estabelecimento?
    @Published var currentCliente: Cliente?
    @Published var isAuthenticated = false
    
    func selectUserType(_ type: UserType) {
        self.currentUserType = type
        self.isAuthenticated = true
    }
    
    func setEstabelecimento(_ estabelecimento: Estabelecimento) {
        self.currentEstabelecimento = estabelecimento
    }
    
    func setCliente(_ cliente: Cliente) {
        self.currentCliente = cliente
    }
    
    func logout() {
        currentUserType = nil
        currentEstabelecimento = nil
        currentCliente = nil
        isAuthenticated = false
    }
}
