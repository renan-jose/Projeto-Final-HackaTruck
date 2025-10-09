import SwiftUI

struct EditarFilaView: View{
    
@State private var senha: String = ""
    
var body: some View {
        ZStack {
            Color.verde
                .edgesIgnoringSafeArea(.top)
            
            VStack {
                Text("Editar Fila")
                    .font(.custom("MontserratAlternates-Bold", size: 25))
                    .foregroundColor(.white)
                    .padding(.top, 20)
                
                Spacer()
                    .frame(height: 40)
                
                ScrollView {
                    ZStack {
                        Rectangle()
                            .frame(width: 350, height: 225)
                            .cornerRadius(10)
                            .foregroundStyle(.white)
                        
                        VStack{
                            Text("Fila RU")
                                .font(.custom("MontserratAlternates-Bold", size: 30))
                                .foregroundStyle(.verde)
                            
                            Spacer()
                                .frame(height: 40)
                            
                            HStack {
                                VStack {
                                    Image(systemName: "person.2.fill")
                                        .foregroundColor(.verde)
                                    
                                    Spacer()
                                        .frame(height: 10)
                                    
                                    Image(systemName: "clock")
                                        .foregroundColor(.verde)
                                    
                                    Spacer()
                                        .frame(height: 10)
                                    
                                    Image(systemName: "figure.roll")
                                        .foregroundColor(.verde)
                                    
                                    Spacer()
                                        .frame(height: 10)
                                    
                                    Image(systemName: "touchid")
                                        .foregroundColor(.verde)
                                }
                                
                                VStack (alignment: .leading) {
                                    Text("Membros:")
                                        .foregroundStyle(.verde)
                                        .font(.custom("Montserrat-Bold", size: 20))
                                    
                                    Spacer()
                                        .frame(height: 5)
                                    
                                    Text("Tempo:")
                                        .foregroundStyle(.verde)
                                        .font(.custom("Montserrat-Bold", size: 20))
                                    
                                    Spacer()
                                        .frame(height: 5)
                                    
                                    Text("Preferencial:")
                                        .foregroundStyle(.verde)
                                        .font(.custom("Montserrat-Bold", size: 20))
                                    
                                    Spacer()
                                        .frame(height: 5)
                                    
                                    Text("ID:")
                                        .foregroundStyle(.verde)
                                        .font(.custom("Montserrat-Bold", size: 20))
                                }

                                
                                VStack (alignment: .trailing) {
                                    Text("157")
                                        .foregroundStyle(.verde)
                                        .font(.custom("Montserrat-Regular", size: 20))
                                    
                                    Spacer()
                                        .frame(height: 5)
                                    
                                    Text("32 min")
                                        .foregroundStyle(.verde)
                                        .font(.custom("Montserrat-Regular", size: 20))
                                    
                                    Spacer()
                                        .frame(height: 5)
                                    
                                    Text("Sim")
                                        .foregroundStyle(.verde)
                                        .font(.custom("Montserrat-Regular", size: 20))
                                    
                                    Spacer()
                                        .frame(height: 5)
                                    
                                    Text("ShgS76b")
                                        .foregroundStyle(.verde)
                                        .font(.custom("Montserrat-Regular", size: 20))
                                }
                            }
                        }
                    }
                    
                    Spacer()
                        .frame(height: 15)
                    
                    Button("Ver Membros"){
                        
                    }
                    .frame(width: 350, height: 50)
                    .background(Color.white)
                    .foregroundColor(.verde)
                    .font(.custom("MontserratAlternates-Bold", size: 20))
                    .cornerRadius(15)
                    
                    Spacer()
                        .frame(height: 15)
                    
                    Button("Desabilitar Preferência"){
                        
                    }
                    .frame(width: 350, height: 50)
                    .background(Color.white)
                    .foregroundColor(.verde)
                    .font(.custom("MontserratAlternates-Bold", size: 20))
                    .cornerRadius(15)
                    
                    Spacer()
                        .frame(height: 15)
                    
                    Button("Excluir Fila"){
                        
                    }
                    .frame(width: 350, height: 50)
                    .background(.red)
                    .foregroundColor(.white)
                    .font(.custom("MontserratAlternates-Bold", size: 20))
                    .cornerRadius(15)
                    
                    Spacer()
                        .frame(height: 15)
                    
                    Button("Voltar"){
                        
                    }
                    .frame(width: 350, height: 50)
                    .foregroundColor(.white)
                    .font(.custom("MontserratAlternates-Bold", size: 20))
                    .cornerRadius(15)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(.white, lineWidth: 2)
                    )
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview{
    
    EditarFilaView()
    
}
