//
//  NFCError.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 25/04/25.
//

import Foundation

enum NFCError: Error {
    case scanningNotSupported
    case invalidURL
    
    var description: String {
        switch self {
        case .scanningNotSupported:
            return "scanningNotSupported".localized
        case .invalidURL:
            return "invalidURL".localized
        }
    }
}
