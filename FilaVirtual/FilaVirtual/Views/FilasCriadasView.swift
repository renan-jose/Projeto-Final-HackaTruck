import SwiftUI

struct FilasCriadasView: View {
    
    @StateObject var filaService = FilaService()
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.verde
                    .edgesIgnoringSafeArea(.top)
                                
                VStack(alignment: .center) {
                    Text("Filas criadas")
                        .font(.custom("MontserratAlternates-Bold", size: 25))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
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
                .scrollContentBackground(.hidden)
                .background(Color.clear)
             
                .padding()
                //            .navigationTitle("Filas")
                .onAppear {
                    filaService.getfilas()
                }
            }
        }
    }
}

struct FilaCardView: View {
    var fila: Fila
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(fila.nome)
                    .font(.custom("MontserratAlternates-Bold", size: 20))
                    .foregroundColor(.white)
                
                Spacer()
                
                HStack {
                    Image(systemName: "person.2.fill")
                        .foregroundStyle(.white)
                }
            }
            .padding(.vertical, 8)
            
            Spacer()
            
            VStack(alignment: .trailing) {
                HStack {
                    Image(systemName: "clock")
                        .foregroundStyle(.white)
                        .font(.caption)
                }
                Spacer()
                
                Image(systemName: "trash.fill")
                    .foregroundColor(.white)
            }
            .padding(.vertical, 8)
        }
}
}

struct FilasCriadasView_Previews: PreviewProvider {
    static var previews: some View {
        FilasCriadasView()
    }
}



