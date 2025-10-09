import SwiftUI

struct Fila: Hashable {
    var nome: String
    var membros: String
    var tempo: String
}

struct MinhasFilasView: View {
    
    var arrayFilas = [
        Fila(nome: "Fila RU", membros: "157", tempo: "32 min"),
        Fila(nome: "Orquidário", membros: "5", tempo: "2 min"),
        Fila(nome: "Cefe", membros: "26", tempo: "13 min"),
        Fila(nome: "Fila TCGL", membros: "42", tempo: "19 min"),
        Fila(nome: "Hospital Veterinário", membros: "42", tempo: "32 min")
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.verde
                    .edgesIgnoringSafeArea(.all)
                
                VStack() {
                    Text("Minhas filas")
                        .font(.custom("MontserratAlternates-Bold", size: 25))
                        .foregroundColor(.white)
                        .padding(.top, 20)
                    
                    List(arrayFilas, id: \.self) { f in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(f.nome)
                                    .font(.custom("MontserratAlternates-Bold", size: 20))
                                    .foregroundColor(.verde)
                                
                                Spacer()
                                
                                HStack {
                                    Image(systemName: "person.2.fill")
                                        .foregroundStyle(.verde)
                                    
                                    Text(f.membros)
                                        .font(.custom("Montserrat-Regular", size: 20))
                                        .foregroundColor(.verde)
                                }
                            }
                            .padding(.vertical, 8)
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                HStack {
                                    Image(systemName: "clock")
                                        .foregroundStyle(.verde)
                                        .font(.caption)
                                    
                                    Text(f.tempo)
                                        .font(.custom("Montserrat-Medium", size: 15))
                                        .foregroundColor(.verde)
                                }
                                Spacer()
                                
                                Image(systemName: "trash.fill")
                                    .foregroundColor(.verde)
                            }
                            .padding(.vertical, 8)
                        }
                    }
                    .listStyle(.insetGrouped)
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    MinhasFilasView()
}
