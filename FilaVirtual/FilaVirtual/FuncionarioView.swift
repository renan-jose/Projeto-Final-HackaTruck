import SwiftUI

struct FuncionarioView: View{
    
    var body: some View{
        
        TabView{
            
            AdicionarFilaView()
                .tabItem {
                    Label("Adicionar fila", systemImage: "plus")
                }
            FilasCriadasView()
                .tabItem {
                    Label("Filas criadas", systemImage: "line.3.horizontal")
                }
            EditarFilaView()
                .tabItem {
                    Label("Editar Fila", systemImage: "gearshape.fill")
                }
            
        }
        .tint(.verde)
        
    }
}

#Preview{
    
    FuncionarioView()
    
}
