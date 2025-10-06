import SwiftUI

struct MinhasFilasView: View{
    
    var body: some View{
        
        NavigationStack{
            
            ZStack{
                
                Color.verde
                    .edgesIgnoringSafeArea(.top)
                
                VStack{
                    
                    Text("Minhas filas")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                    
                    ScrollView{
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
}

#Preview{
    
    MinhasFilasView()
    
}
