
import SwiftUI

struct ContentView: View {
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some View {
        Group {
            if authViewModel.isAuthenticated {
                MainTabView()
            } else {
                WelcomeView()
            }
        }
        .environmentObject(authViewModel)
    }
}

struct WelcomeView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Chuva de Prata")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Sistema de Gerenciamento de Filas")
                .font(.title2)
                .foregroundColor(.gray)
            
            Spacer()
            
            VStack(spacing: 20) {
                Button("Sou CLIENTE") {
                    authViewModel.selectUserType(.client)
                }
                .buttonStyle(PrimaryButtonStyle())
                
                Button("Sou ESTABELECIMENTO") {
                    authViewModel.selectUserType(.provider)
                }
                .buttonStyle(PrimaryButtonStyle())
            }
            
            Spacer()
        }
        .padding()
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, minHeight: 60)
            .background(Color.blue)
            .cornerRadius(12)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

#Preview {
    ContentView()
}
