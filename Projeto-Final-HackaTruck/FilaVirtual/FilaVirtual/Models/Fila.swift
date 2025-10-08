import Foundation

struct Fila: Codable, Identifiable, Hashable {
    let id: String
    let rev: String?
    let nome: String
    let preferencial: Bool
    let tempoMedio: Int
    var numProx: Int
    var numAtual: Int
    let estabelecimentoId: String
    let type = "fila"
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case rev = "_rev"
        case nome
        case preferencial
        case tempoMedio = "tempo_medio"
        case numProx = "num_prox"
        case numAtual = "num_atual"
        case estabelecimentoId = "estabelecimento_id"
        case type
    }
    
    init(id: String = UUID().uuidString, rev: String? = nil, nome: String, preferencial: Bool, tempoMedio: Int, numProx: Int, numAtual: Int, estabelecimentoId: String) {
        self.id = id
        self.rev = rev
        self.nome = nome
        self.preferencial = preferencial
        self.tempoMedio = tempoMedio
        self.numProx = numProx
        self.numAtual = numAtual
        self.estabelecimentoId = estabelecimentoId
    }
}
