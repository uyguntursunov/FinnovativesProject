//
//  NFCRepositoryProtocol.swift
//  FinnovativesTeamProject
//
//  Created by Uyg'un Tursunov on 30/04/25.
//

import Foundation

protocol NFCRepositoryProtocol {
    func scanNFC(_ completion: @escaping (Result<URL, Error>) -> Void)
}
