import Foundation

struct Fila: Codable, Hashable {
    let _id: String?
    let _rev: String?
    let nome: String
    let preferencial: Bool
    let tempo_medio: Int
    var num_prox: Int
    var num_atual: Int
    let estabelecimento_nome: String

}
