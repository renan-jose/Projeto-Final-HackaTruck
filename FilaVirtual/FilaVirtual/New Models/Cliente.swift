import Foundation

struct Cliente: Codable, Hashable {
    let _id: String?
    let _rev: String?
    let nome: String
    let type = "cliente"
    
    enum CodingKeys: String, CodingKey {
        case _id
        case _rev
        case nome
        case type
    }
}
