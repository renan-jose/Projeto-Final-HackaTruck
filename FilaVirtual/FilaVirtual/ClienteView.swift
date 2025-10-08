import SwiftUI

struct ClienteView: View{
    
    var body: some View{
        
        TabView {
                    
            FilasProximasView()
                .tabItem {
                    Label("Filas próximas", systemImage: "pin.fill")
                }
                    
            EntrarFilaView()
                .tabItem {
                    Label("Entrar na fila", systemImage: "plus")
                }
                    
            MinhasFilasView()
                .tabItem {
                    Label("Minhas filas", systemImage: "line.3.horizontal")
                }
                }
        .tint(.verde)
        
    }
    
}

#Preview{
    
    ClienteView()
    
}
