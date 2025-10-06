import SwiftUI

struct MinhasFilasView: View{
    
    var body: some View{
        
        NavigationStack{
            
            VStack{
                
                Text("Minhas filas")
                    .font(.system(size: 25))
                    .foregroundColor(.verde)
                
                ScrollView{
                    
                }
                
            }
            
        }
        
    }
    
}

#Preview{
    
    MinhasFilasView()
    
}
