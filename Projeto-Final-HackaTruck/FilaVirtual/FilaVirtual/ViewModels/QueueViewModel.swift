//
//  QueueViewModel.swift
//  FilaVirtual
//
//  Created by Turma01 on 07/10/25.
//


import Foundation
import Combine

class QueueViewModel: ObservableObject {
    @Published var filas: [Fila] = []
    @Published var entradas: [Entrada] = []
    @Published var clientes: [Cliente] = []
    @Published var estabelecimentos: [Estabelecimento] = []
    @Published var isLoading = false
    
    private let apiService = APIService()
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Provider Methods
    func criarFila(nome: String, preferencial: Bool, tempoMedio: Int, estabelecimentoId: String, completion: @escaping (Bool) -> Void) {
        let novaFila = Fila(
            nome: nome,
            preferencial: preferencial,
            tempoMedio: tempoMedio,
            numProx: 1,
            numAtual: 0,
            estabelecimentoId: estabelecimentoId
        )
        
        apiService.criarFila(novaFila) { [weak self] success in
            if success {
                self?.carregarFilas(estabelecimentoId: estabelecimentoId)
            }
            completion(success)
        }
    }
    
    func avancarFila(fila: Fila, completion: @escaping (Bool) -> Void) {
        var filaAtualizada = fila
        filaAtualizada.numAtual += 1
        
        apiService.atualizarFila(filaAtualizada) { [weak self] success in
            if success {
                self?.carregarFilas(estabelecimentoId: fila.estabelecimentoId)
            }
            completion(success)
        }
    }
    
    // MARK: - Client Methods
    func entrarNaFila(fila: Fila, cliente: Cliente, completion: @escaping (Bool) -> Void) {
        let entrada = Entrada(
            clienteId: cliente.id,
            filaId: fila.id,
            estabelecimentoId: fila.estabelecimentoId,
            num: fila.numProx
        )
        
        var filaAtualizada = fila
        filaAtualizada.numProx += 1
        
        // Primeiro cria a entrada, depois atualiza a fila
        apiService.entrarNaFila(entrada: entrada) { [weak self] success in
            guard success else {
                completion(false)
                return
            }
            
            self?.apiService.atualizarFila(filaAtualizada) { success in
                if success {
                    self?.carregarMinhasFilas(clienteId: cliente.id)
                }
                completion(success)
            }
        }
    }
    
    func sairDaFila(entrada: Entrada, completion: @escaping (Bool) -> Void) {
        apiService.deletarEntrada(entrada) { [weak self] success in
            if success, let clienteId = self?.entradas.first(where: { $0.id == entrada.id })?.clienteId {
                self?.carregarMinhasFilas(clienteId: clienteId)
            }
            completion(success)
        }
    }
    
    // MARK: - Load Methods
    func carregarFilas(estabelecimentoId: String) {
        isLoading = true
        apiService.fetchFilas(estabelecimentoId: estabelecimentoId) { [weak self] filas in
            self?.filas = filas
            self?.isLoading = false
        }
    }
    
    func carregarMinhasFilas(clienteId: String) {
        isLoading = true
        apiService.fetchEntradas(clienteId: clienteId) { [weak self] entradas in
            self?.entradas = entradas
            self?.isLoading = false
        }
    }
    
    func carregarClientes() {
        apiService.fetchClientes { [weak self] clientes in
            self?.clientes = clientes
        }
    }
    
    func carregarEstabelecimentos() {
        apiService.fetchEstabelecimentos { [weak self] estabelecimentos in
            self?.estabelecimentos = estabelecimentos
        }
    }
    
    // MARK: - Helper Methods
    func calcularPosicao(fila: Fila, numero: Int) -> Int {
        if fila.preferencial {
            // Lógica para fila preferencial (exemplo simples)
            return numero - fila.numAtual
        } else {
            // Fila normal
            return numero - fila.numAtual
        }
    }
    
    func tempoEstimado(fila: Fila, posicao: Int) -> Int {
        return posicao * fila.tempoMedio
    }
}
