import SwiftUI

struct ContentView: View{
    
    var body: some View{
        
        ZStack{
            
            Color.white
                .ignoresSafeArea()
            
            VStack{
                
                Image("LogoFinal_QueueWe(verde)")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(0.8)
                    .padding(.top, 64)
                
                Spacer()
                
                Text("Selecione o tipo de usuário")
                    .font(.system(size: 25))
                    .foregroundColor(.verde)
                
                Button("Cliente"){
                    
                }
                .frame(width: 300, height: 60)
                .background(Color.verde)
                .foregroundColor(.white)
                .font(.system(size: 30))
                .cornerRadius(15)
                .padding(.top, 8)
                
                Button("Funcionário"){
                    
                }
                .frame(width: 300, height: 60)
                .background(Color.verde)
                .foregroundColor(.white)
                .font(.system(size: 30))
                .cornerRadius(15)
                .padding(.top, 8)
                
                Spacer()
                
            }
            
        }
        
    }
    
}

#Preview{
    
    ContentView()
    
}
