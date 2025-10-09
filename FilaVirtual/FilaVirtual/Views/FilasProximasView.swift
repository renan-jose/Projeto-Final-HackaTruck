import SwiftUI
import MapKit

struct FilasProximasView: View{
    
    @State private var position = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -14.2350, longitude: -51.9253),
        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
    )
    
    @State private var indiceSelecionado = 0
    @State private var mostrandoSheet = false
    
    struct Location: Hashable{
        let nome: String
        let foto: String
        let descricao: String
        let latitude: Double
        let longitude: Double
    }
    
    var arrayLocais = [
        Location(nome: "Cristo Redentor", foto: "cristo_redentor", descricao: "Muito bonito", latitude: -22.9520561, longitude: -43.2105388),
        Location(nome: "UEL", foto: "uel", descricao: "A melhor universidade do Brasil!", latitude: -23.325886835891122, longitude: -51.202285355810226)
        
    ]
    
    
    var body: some View{
        
        ZStack{
            
            Color.verde
                .edgesIgnoringSafeArea(.top)
            
            VStack{
                        
                Text("Filas próximas")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                
                ZStack{
                    
                    Rectangle()
                        .frame(width: 300, height: 500)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                    
                    Map(position: $position){
                        ForEach(arrayLocais, id: \.self){regiao in
                            Annotation(regiao.nome ,coordinate: CLLocationCoordinate2D(latitude: regiao.latitude, longitude: regiao.longitude)){
                                
                                Button {
                                    if let index = arrayLocais.firstIndex(of: regiao) {
                                        indiceSelecionado = index
                                        mostrandoSheet = true
                                    }
                                } label: {
                                    VStack {
                                        Image(systemName: "mappin.circle.fill")
                                            .foregroundColor(.black)
                                            .font(.title)
                                        Text(regiao.nome)
                                            .font(.caption)
                                            .fixedSize()
                                    }
                                }
                            }
                            
                            
                        }
                    }
                    .frame(width: 280, height: 480)
                    .cornerRadius(15)
                    
                }
                
                Button("Entrar de outra forma"){
                    
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

//#Preview{
//    
//    FilasProximasView()
//    
//}
