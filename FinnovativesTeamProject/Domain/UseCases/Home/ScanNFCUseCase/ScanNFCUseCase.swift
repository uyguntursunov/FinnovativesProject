//
//  ScanNFCUseCase.swift
//  FinnovativesTeamProject
//
//  Created by Uyg'un Tursunov on 29/04/25.
//

import Foundation

protocol ScanNFCUseCaseProtocol {
    func execute(_ completion: @escaping (Result<URL, Error>) -> Void)
}

final class ScanNFCUseCase: ScanNFCUseCaseProtocol {
    let nfcRepository: NFCRepositoryProtocol
    
    init(nfcRepository: NFCRepositoryProtocol = NFCRepository()) {
        self.nfcRepository = nfcRepository
    }
    
    func execute(_ completion: @escaping (Result<URL, any Error>) -> Void) {
        nfcRepository.scanNFC { result in
            completion(result)
        }
    }
}
