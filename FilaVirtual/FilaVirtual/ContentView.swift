import SwiftUI

struct ContentView: View{
    
    var body: some View{
        
        ZStack{
            
            Color.verde
                .ignoresSafeArea()
            
            VStack{
                
                Text("Selecione o tipo de usuário")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    
                    
                
                Button("Cliente"){
                    
                }
                .frame(width: 300, height: 60)
                .background(Color.white)
                .foregroundColor(.verde)
                .font(.system(size: 30))
                .cornerRadius(15)
                .padding(.top, 8)
                
                
                Button("Funcionário"){
                    
                }
                .frame(width: 300, height: 60)
                .background(Color.white)
                .foregroundColor(.verde)
                .font(.system(size: 30))
                .cornerRadius(15)
                .padding(.top, 8)
                
                
            }
            
        }
        
    }
    
}

#Preview{
    
    ContentView()
    
}
