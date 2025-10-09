import Foundation

struct Entrada: Codable, Hashable {
    let _id: String?
    let _rev: String?
    let clienteId: String
    let filaId: String
    let estabelecimentoId: String
    let num: Int
    let timestamp: String
    let type = "entrada"
    
    enum CodingKeys: String, CodingKey {
        case _id
        case _rev
        case clienteId = "cliente_id"
        case filaId = "fila_id"
        case estabelecimentoId = "estabelecimento_id"
        case num
        case timestamp
        case type
    }
}
