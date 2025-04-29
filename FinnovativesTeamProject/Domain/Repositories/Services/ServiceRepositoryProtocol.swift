//
//  ServiceRepositoryProtocol.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 29/04/25.
//

import Foundation

protocol ServiceRepositoryProtocol {
    func fetchServices(_ completion: @escaping ([ServiceEntity]) -> Void)
}
