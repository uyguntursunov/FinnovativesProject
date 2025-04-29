//
//  CompanyRepositoryProtocol.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 29/04/25.
//

import Foundation

protocol CompanyRepositoryProtocol {
    func fetchCompanies(_ completion: @escaping (Result<[CompanyEntity], Error>) -> Void)
}
