import SwiftUI

struct ClienteView: View{
    
    var body: some View{
        
        TabView{
            
            FilasProximasView()
                .tabItem {
                    Label("Filas próximas", systemImage: "pin.fill")
                }
            
        }
        
        
        
    }
    
}

#Preview{
    
    ClienteView()
    
}
