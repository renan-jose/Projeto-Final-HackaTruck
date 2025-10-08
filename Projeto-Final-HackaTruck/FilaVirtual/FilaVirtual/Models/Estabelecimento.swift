import Foundation

struct Estabelecimento: Codable, Identifiable, Hashable {
    let id: String
    let rev: String?
    let nome: String
    let type = "estabelecimento"
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case rev = "_rev"
        case nome
        case type
    }
    
    init(id: String = UUID().uuidString, rev: String? = nil, nome: String) {
        self.id = id
        self.rev = rev
        self.nome = nome
    }
}
