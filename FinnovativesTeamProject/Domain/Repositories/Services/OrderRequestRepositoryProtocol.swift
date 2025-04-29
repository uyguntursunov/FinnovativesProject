//
//  OrderRequestRepositoryProtocol.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 29/04/25.
//

import Foundation

protocol OrderRequestRepositoryProtocol {
    func makeOrder(entity: OrderRequestEntity, completion: @escaping (Bool) -> Void)
}
