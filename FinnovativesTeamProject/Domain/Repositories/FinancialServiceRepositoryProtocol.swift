//
//  FinancialServiceRepositoryProtocol.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 29/04/25.
//

import Foundation

protocol FinancialServiceRepositoryProtocol {
    func fetchFinancialServices(_ completion: @escaping (Result<[FinancialServiceEntity], Error>) -> Void)
}
