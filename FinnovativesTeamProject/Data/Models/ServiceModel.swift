//
//  SericeModel.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 13/04/25.
//

import SwiftUI

struct ServiceModel: Identifiable {
    let id = UUID()
    let imageString: String
    let title: String
    let subtitle: String
    let type: ServiceType
}

struct CompanyModel: Codable, Identifiable{
    let id: String
    let name: String
    let imageUrl: String
}

struct OrderRequestModel: Codable {
    let comapnyName: String
    let companyPhone: String
    let numberOfNFCStickers: Int
    let companyID: String
}
