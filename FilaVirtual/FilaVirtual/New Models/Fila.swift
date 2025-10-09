import Foundation

struct Fila: Codable, Hashable {
    let _id: String?
    let _rev: String?
    let nome: String
    let preferencial: Bool
    let tempoMedio: Int
    var numProx: Int
    var numAtual: Int
    let estabelecimentoId: String
    let type = "fila"
    
    enum CodingKeys: String, CodingKey {
        case _id
        case _rev
        case nome
        case preferencial
        case tempoMedio = "tempo_medio"
        case numProx = "num_prox"
        case numAtual = "num_atual"
        case estabelecimentoId = "estabelecimento_id"
        case type
    }
}
