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
                    .padding(.top, 60)
                
                Spacer()
                
                Text("Selecione o tipo de usuário")
                    .font(.custom("BebasNeue-Regular", size: 25))
                    .foregroundColor(.verde)
                
                Button("Cliente"){
                    
                }
                .frame(width: 300, height: 60)
                .background(Color.verde)
                .foregroundColor(.white)
                .font(.custom("MontserratAlternates-Bold", size: 25))
                .cornerRadius(15)
                .padding(.top, 8)
                
                Button("Funcionário"){
                    
                }
                .frame(width: 300, height: 60)
                .background(Color.verde)
                .foregroundColor(.white)
                .font(.custom("MontserratAlternates-Bold", size: 25))
                .cornerRadius(15)
                .padding(.top, 8)
                
                Spacer()
                Spacer()
                
            }
            
        }
        
    }
    
}

#Preview{
    
    ContentView()
    
}
