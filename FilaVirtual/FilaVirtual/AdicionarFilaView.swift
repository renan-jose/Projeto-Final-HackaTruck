import SwiftUI

struct AdicionarFilaView: View{
    
    @State private var nomeFila: String = ""
    @State private var senha: String = ""
    @State private var senhaIsOn: Bool = false
    @State private var prefIsOn: Bool = false
    @State private var tempoIsOn: Bool = false
    @State private var mapaIsOn: Bool = false
    
    var body: some View {
        ZStack {
            Color.verde
                .edgesIgnoringSafeArea(.top)
            
            VStack {
                Text("Adicionar Fila")
                    .font(.custom("MontserratAlternates-Bold", size: 25))
                    .foregroundColor(.white)
                    .padding(.top, 20)
                
                Spacer()
                    .frame(height: 40)
                
                ScrollView {
                    HStack {
                        Text("Nome:")
                            .font(.custom("MontserratAlternates-Bold", size: 20))
                            .foregroundColor(.verde)
                            .padding(.leading, 20)
                            .padding(.trailing, 10)
                        
                        TextField("", text: $nomeFila)
                            .frame(height: 20)
                            .padding(10)
                            .background(.verdeEscuro)
                            .foregroundColor(.white)
                        
                    }
                    
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .background(Color.green)
                    
                    Spacer()
                        .frame(height: 15)
                    
                    HStack {
                        Text("Habilitar Senha")
                            .font(.custom("MontserratAlternates-Bold", size: 20))
                            .foregroundColor(.verde)
                            .padding(.leading, 10)
                        
                        Spacer()
                        
                        Toggle("", isOn: $senhaIsOn)
                            .labelsHidden()
                            .toggleStyle(SwitchToggleStyle(tint: .verdeEscuro))
                    }
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    Spacer()
                        .frame(height: 15)
                    
                    HStack {
                        Text("Senha:")
                            .font(.custom("MontserratAlternates-Bold", size: 20))
                            .foregroundColor(.verde)
                            .padding(.leading, 20)
                            .padding(.trailing, 10)
                        
                        TextField("", text: $senha)
                            .frame(height: 20)
                            .padding(10)
                            .background(.verdeEscuro)
                            .foregroundColor(.white)
                        
                    }
                    
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .background(Color.green)
                    
                    Spacer()
                        .frame(height: 15)
                    
                    HStack {
                        Text("Habilitar Senha")
                            .font(.custom("MontserratAlternates-Bold", size: 20))
                            .foregroundColor(.verde)
                            .padding(.leading, 10)
                        
                        Spacer()
                        
                        Toggle("", isOn: $senhaIsOn)
                            .labelsHidden()
                            .toggleStyle(SwitchToggleStyle(tint: .verdeEscuro))
                    }
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    Spacer()
                        .frame(height: 15)
                    
                    HStack {
                        Text("Habilitar Preferência")
                            .font(.custom("MontserratAlternates-Bold", size: 20))
                            .foregroundColor(.verde)
                            .padding(.leading, 10)
                        
                        Spacer()
                        
                        Toggle("", isOn: $prefIsOn)
                            .labelsHidden()
                            .toggleStyle(SwitchToggleStyle(tint: .verdeEscuro))
                    }
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    Spacer()
                        .frame(height: 15)
                    
                    HStack {
                        Text("Mostrar Tempo")
                            .font(.custom("MontserratAlternates-Bold", size: 20))
                            .foregroundColor(.verde)
                            .padding(.leading, 10)
                        
                        Spacer()
                        
                        Toggle("", isOn: $tempoIsOn)
                            .labelsHidden()
                            .toggleStyle(SwitchToggleStyle(tint: .verdeEscuro))
                    }
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    Spacer()
                        .frame(height: 15)
                    
                    HStack {
                        Text("Mostrar no Mapa")
                            .font(.custom("MontserratAlternates-Bold", size: 20))
                            .foregroundColor(.verde)
                            .padding(.leading, 10)
                        
                        Image(systemName: "crown.fill")
                            .foregroundStyle(.verde)
                        
                        Spacer()
                        
                        Toggle("", isOn: $mapaIsOn)
                            .labelsHidden()
                            .toggleStyle(SwitchToggleStyle(tint: .verdeEscuro))
                    }
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    Spacer()
                        .frame(height: 15)
                    
                    Button("Cancelar"){
                        
                    }
                    .frame(width: 350, height: 50)
                    .background(.red)
                    .foregroundColor(.white)
                    .font(.custom("MontserratAlternates-Bold", size: 20))
                    .cornerRadius(15)
                    
                    Spacer()
                        .frame(height: 15)
                    
                    Button("Confirmar"){
                        
                    }
                    .frame(width: 350, height: 50)
                    .foregroundColor(.white)
                    .font(.custom("MontserratAlternates-Bold", size: 20))
                    .cornerRadius(15)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(.white, lineWidth: 2)
                    )
                }
            }
        }
    }
}

#Preview{
    
    AdicionarFilaView()
    
}
