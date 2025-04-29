//
//  EventRepositoryProtocol.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 29/04/25.
//

import Foundation

protocol EventRepositoryProtocol {
    func fetchEvents(_ completion: @escaping (Result<[EventEntity], Error>) -> Void)
}
