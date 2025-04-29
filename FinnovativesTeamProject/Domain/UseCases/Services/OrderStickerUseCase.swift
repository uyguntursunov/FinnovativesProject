//
//  OrderStickerUseCase.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 29/04/25.
//

import Foundation

protocol OrderStickerUseCaseProtocol {
    func execute(entity: OrderRequestEntity, completion: @escaping (Bool) -> Void)
}

final class OrderStickersUseCase: OrderStickerUseCaseProtocol {
    let orderRequestRepository: OrderRequestRepositoryProtocol
    
    init(orderRequestRepository: OrderRequestRepositoryProtocol = OrderRequestRepository()) {
        self.orderRequestRepository = orderRequestRepository
    }
    
    func execute(entity: OrderRequestEntity, completion: @escaping (Bool) -> Void) {
        orderRequestRepository.makeOrder(entity: entity, completion: completion)
    }
}
