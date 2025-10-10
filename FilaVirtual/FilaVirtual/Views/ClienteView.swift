import SwiftUI

struct ClienteView: View{
    
    let userName: String
    
    var body: some View{
        
        
        TabView {
                    
            FilasProximasView()
                .tabItem {
                    Label("Filas próximas", systemImage: "pin.fill")
                }
                    
            EntrarFilaView(userName: userName)
                .tabItem {
                    Label("Entrar na fila", systemImage: "plus")
                }
                    
            FilasCriadasView()
                .tabItem {
                    Label("Minhas filas", systemImage: "line.3.horizontal")
                }
                }
        .tint(.verde)
        
    }
    
}

//#Preview{
//    
//    ClienteView()
//    
//}
