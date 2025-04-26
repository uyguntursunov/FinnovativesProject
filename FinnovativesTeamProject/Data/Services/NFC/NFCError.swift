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
            return "Scanning NFC is not supported on this device."
        case .invalidURL:
            return "Invalid URL format."
        }
    }
}
