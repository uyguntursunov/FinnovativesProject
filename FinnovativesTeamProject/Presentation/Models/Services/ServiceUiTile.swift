//
//  ServiceUiTile.swift
//  FinnovativesTeamProject
//
//  Created by Uyg'un Tursunov on 29/04/25.
//

import Foundation

struct ServiceUiTile: Identifiable {
    let id = UUID()
    let imageString: String
    let title: String
    let subtitle: String
    let type: ServiceType
}
