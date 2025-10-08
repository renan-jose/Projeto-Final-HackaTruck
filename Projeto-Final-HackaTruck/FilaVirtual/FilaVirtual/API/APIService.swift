import Foundation
import Combine

class APIService: ObservableObject {
    private let baseURL = "http://127.0.0.1:1880"
    
    // MARK: - GET Methods
    func fetchClientes(completion: @escaping ([Cliente]) -> Void) {
        guard let url = URL(string: "\(baseURL)/getcliente") else {
            print("❌ URL inválida: /getcliente")
            completion([])
            return
        }
        
        print("🔍 Buscando clientes: \(url)")
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("❌ Erro na requisição: \(error)")
                DispatchQueue.main.async { completion([]) }
                return
            }
            
            guard let data = data else {
                print("❌ Nenhum dados recebido")
                DispatchQueue.main.async { completion([]) }
                return
            }
            
            // Debug: print raw response
            if let jsonString = String(data: data, encoding: .utf8) {
                print("📦 Resposta bruta: \(jsonString)")
            }
            
            do {
                let clientes = try JSONDecoder().decode([Cliente].self, from: data)
                print("✅ Clientes carregados: \(clientes.count)")
                DispatchQueue.main.async {
                    completion(clientes)
                }
            } catch {
                print("❌ Erro ao decodificar clientes: \(error)")
                DispatchQueue.main.async {
                    completion([])
                }
            }
        }.resume()
    }
    
    func fetchEstabelecimentos(completion: @escaping ([Estabelecimento]) -> Void) {
        guard let url = URL(string: "\(baseURL)/getestab") else {
            completion([])
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print("❌ Nenhum dado recebido de estabelecimentos")
                DispatchQueue.main.async { completion([]) }
                return
            }
            
            do {
                let estabelecimentos = try JSONDecoder().decode([Estabelecimento].self, from: data)
                print("✅ Estabelecimentos carregados: \(estabelecimentos.count)")
                DispatchQueue.main.async {
                    completion(estabelecimentos)
                }
            } catch {
                print("❌ Erro ao buscar estabelecimentos: \(error)")
                DispatchQueue.main.async {
                    completion([])
                }
            }
        }.resume()
    }
    
    func fetchFilas(estabelecimentoId: String, completion: @escaping ([Fila]) -> Void) {
        // ATENÇÃO: Seu endpoint GET filas não tem parâmetros na imagem
        // Você precisa criar um endpoint específico ou ajustar o Node-RED
        guard let url = URL(string: "\(baseURL)/getfila") else {
            completion([])
            return
        }
        
        print("🔍 Buscando filas: \(url)")
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                DispatchQueue.main.async { completion([]) }
                return
            }
            
            // Debug
            if let jsonString = String(data: data, encoding: .utf8) {
                print("📦 Resposta filas: \(jsonString)")
            }
            
            do {
                let todasFilas = try JSONDecoder().decode([Fila].self, from: data)
                // Filtrar no Swift pelo estabelecimentoId
                let filasFiltradas = todasFilas.filter { $0.estabelecimentoId == estabelecimentoId }
                print("✅ Filas carregadas: \(filasFiltradas.count) para estabelecimento \(estabelecimentoId)")
                DispatchQueue.main.async {
                    completion(filasFiltradas)
                }
            } catch {
                print("❌ Erro ao buscar filas: \(error)")
                DispatchQueue.main.async {
                    completion([])
                }
            }
        }.resume()
    }
    
    func fetchEntradas(clienteId: String, completion: @escaping ([Entrada]) -> Void) {
        // ATENÇÃO: Seu endpoint GET entrada não tem parâmetros
        guard let url = URL(string: "\(baseURL)/getentrada") else {
            completion([])
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                DispatchQueue.main.async { completion([]) }
                return
            }
            
            do {
                let todasEntradas = try JSONDecoder().decode([Entrada].self, from: data)
                // Filtrar no Swift pelo clienteId
                let entradasFiltradas = todasEntradas.filter { $0.clienteId == clienteId }
                DispatchQueue.main.async {
                    completion(entradasFiltradas)
                }
            } catch {
                print("❌ Erro ao buscar entradas: \(error)")
                DispatchQueue.main.async {
                    completion([])
                }
            }
        }.resume()
    }
    
    // MARK: - POST/PUT Methods
    func criarFila(_ fila: Fila, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "\(baseURL)/postfila") else { // CORRIGIDO: postfila (sem S)
            print("❌ URL inválida para criar fila")
            completion(false)
            return
        }
        
        print("📤 Criando fila: \(url)")
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(fila)
            request.httpBody = jsonData
            
            // Debug: print what we're sending
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print("📤 Enviando dados: \(jsonString)")
            }
        } catch {
            print("❌ Erro ao codificar fila: \(error)")
            completion(false)
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("❌ Erro na requisição: \(error)")
                DispatchQueue.main.async { completion(false) }
                return
            }
            
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
            print("📥 Resposta: Status \(statusCode)")
            
            if let data = data, let responseString = String(data: data, encoding: .utf8) {
                print("📥 Resposta completa: \(responseString)")
            }
            
            DispatchQueue.main.async {
                let success = error == nil && statusCode == 200
                print(success ? "✅ Fila criada com sucesso" : "❌ Falha ao criar fila")
                completion(success)
            }
        }.resume()
    }
    
    func atualizarFila(_ fila: Fila, completion: @escaping (Bool) -> Void) {
        // ATENÇÃO: Você não tem endpoint PUT na imagem!
        // Vou usar POST para atualizar também, ou você precisa criar o PUT
        guard let url = URL(string: "\(baseURL)/postfila") else {
            completion(false)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST" // Usando POST para atualizar
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONEncoder().encode(fila)
        } catch {
            completion(false)
            return
        }
        
        URLSession.shared.dataTask(with: request) { _, response, error in
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
            print("📤 Atualizando fila - Status: \(statusCode)")
            
            DispatchQueue.main.async {
                completion(error == nil && statusCode == 200)
            }
        }.resume()
    }
    
    func entrarNaFila(entrada: Entrada, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "\(baseURL)/postentrada") else {
            completion(false)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONEncoder().encode(entrada)
        } catch {
            completion(false)
            return
        }
        
        URLSession.shared.dataTask(with: request) { _, response, error in
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
            print("📤 Entrando na fila - Status: \(statusCode)")
            
            DispatchQueue.main.async {
                completion(error == nil && statusCode == 200)
            }
        }.resume()
    }
    
    func deletarEntrada(_ entrada: Entrada, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "\(baseURL)/deleteentrada/\(entrada.id)?rev=\(entrada.rev ?? "")") else {
            completion(false)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        URLSession.shared.dataTask(with: request) { _, response, error in
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
            print("🗑️ Deletando entrada - Status: \(statusCode)")
            
            DispatchQueue.main.async {
                completion(error == nil && statusCode == 200)
            }
        }.resume()
    }
}
