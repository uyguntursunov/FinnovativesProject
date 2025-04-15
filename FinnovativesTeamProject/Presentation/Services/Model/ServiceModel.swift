//
//  SericeModel.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 13/04/25.
//

import Foundation

struct Service: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let subtitle: String
    let type: ServiceType
}

struct TabItemModel {
    let title: String
    let icon: String
    let label: String
}

struct ServiceProvider: Identifiable {
    let id = UUID()
    let name: String
    let logo: String
}
