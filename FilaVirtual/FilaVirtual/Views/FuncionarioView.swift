import SwiftUI

struct FuncionarioView: View{
    
    let userName: String
    
    var body: some View{
        NavigationStack {
            TabView{
                
                AdicionarFilaView()
                    .tabItem {
                        Label("Adicionar fila", systemImage: "plus")
                    }
                
                FilasCriadasView()
                    .tabItem {
                        Label("Filas criadas", systemImage: "line.3.horizontal")
                    }
                
            }
            .tint(.verde)
        }
    }
    
}

//#Preview{
//    
//    FuncionarioView()
//    
//}
