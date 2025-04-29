//
//  OrderRequestRepository.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 29/04/25.
//

import Foundation

final class OrderRequestRepository: OrderRequestRepositoryProtocol {
    let networkManager: NetworkManagerProtocol
    let orderRequestMapper: OrderRequestMapperProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager.shared,
         orderRequestMapper: OrderRequestMapperProtocol = OrderRequestMapper()) {
        self.networkManager = networkManager
        self.orderRequestMapper = orderRequestMapper
    }
    
    func makeOrder(entity: OrderRequestEntity, completion: @escaping (Bool) -> Void) {
        let model = orderRequestMapper.map(entity)
        networkManager.postOrder(model: model) { result in
            completion(result)
        }
    }
}
