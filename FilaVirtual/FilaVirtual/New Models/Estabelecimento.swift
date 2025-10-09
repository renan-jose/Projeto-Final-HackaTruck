import Foundation

struct Estabelecimento: Codable, Hashable {
    let _id: String?
    let _rev: String?
    let nome: String
    let type = "estabelecimento"
    
    enum CodingKeys: String, CodingKey {
        case _id
        case _rev
        case nome
        case type
    }

}
