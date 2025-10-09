import SwiftUI

struct FilasCriadasView: View {
    
    @StateObject var filaService = FilaService()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Filas criadas")
                    .font(.system(size: 25))
                    .foregroundColor(.verde)
                
                if filaService.filas.isEmpty {
                    Text("Nenhuma fila encontrada.")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    ScrollView {
                        VStack(spacing: 10) {
                            ForEach(filaService.filas, id: \.self) { fila in
                                FilaCardView(fila: fila)
                            }
                        }
                        .padding()
                    }
                }
            }
            .padding()
//            .navigationTitle("Filas")
            .onAppear {
                filaService.getfilas()
            }
        }
    }
}

struct FilaCardView: View {
    var fila: Fila
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(fila.nome)
                .font(.headline)
                .foregroundColor(.primary)

            Text("Preferencial: \(fila.preferencial ? "Sim" : "Não")")
                .font(.subheadline)

            Text("Tempo médio: \(fila.tempoMedio) minutos")
                .font(.subheadline)

            Text("Próximo número: \(fila.numProx)")
                .font(.subheadline)

            Text("Número atual: \(fila.numAtual)")
                .font(.subheadline)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

struct FilasCriadasView_Previews: PreviewProvider {
    static var previews: some View {
        FilasCriadasView()
    }
}
