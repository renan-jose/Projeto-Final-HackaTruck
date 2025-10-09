import SwiftUI

struct ContentView: View{
    
    @State var userName = ""
    
    var body: some View{
        
        NavigationStack {
//            if (entrouCliente) {
//                ClienteView()
//            }
//            else if (entrouFuncionario) {
//                FuncionarioView()
//            }
//            else {
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
                        
                        HStack {
                           
                            TextField("Seu Nome", text: $userName)
                                .frame(height: 30)
                                .padding(10)
                                .background(.verdeEscuro)
                                .cornerRadius(8)
                                .foregroundColor(.white)
                                .font(.custom("MontserratAlternates-Bold", size: 18))
                                .foregroundColor(.verde)
                                .padding(.leading, 20)
                                .padding(.trailing, 10)
                            
                        }
                        
                        Text("Selecione o tipo de usuário")
                            .font(.custom("BebasNeue-Regular", size: 20))
                            .foregroundColor(.verde)
                        
                        NavigationLink(destination: ClienteView(userName: userName)){
                            Text("Cliente")
                        }
                        .frame(width: 300, height: 60)
                        .background(Color.verde)
                        .foregroundColor(.white)
                        .font(.custom("MontserratAlternates-Bold", size: 25))
                        .cornerRadius(15)
                        .padding(.top, 8)
                        
                        NavigationLink(destination: FuncionarioView(userName: userName)){
                            Text("Funcionario")
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
    }
    


#Preview{
    
    ContentView()
    
}
