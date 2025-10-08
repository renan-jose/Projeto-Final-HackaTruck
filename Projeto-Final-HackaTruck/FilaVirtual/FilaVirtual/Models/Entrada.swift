import Foundation

struct Entrada: Codable, Identifiable, Hashable {
    let id: String
    let rev: String?
    let clienteId: String
    let filaId: String
    let estabelecimentoId: String
    let num: Int
    let timestamp: String
    let type = "entrada"
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case rev = "_rev"
        case clienteId = "cliente_id"
        case filaId = "fila_id"
        case estabelecimentoId = "estabelecimento_id"
        case num
        case timestamp
        case type
    }
    
    init(id: String = "ent_\(UUID().uuidString)", rev: String? = nil, clienteId: String, filaId: String, estabelecimentoId: String, num: Int, timestamp: String = ISO8601DateFormatter().string(from: Date())) {
        self.id = id
        self.rev = rev
        self.clienteId = clienteId
        self.filaId = filaId
        self.estabelecimentoId = estabelecimentoId
        self.num = num
        self.timestamp = timestamp
    }
}
