//
//  SericeModel.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 13/04/25.
//

import SwiftUI

struct Service: Identifiable {
    let id = UUID()
    let image: UIImage?
    let title: ServiceTitles
    let subtitle: ServiceSubtitles
    let type: ServiceType
}

struct CompanyModel: Codable, Identifiable{
    var id: String
    let name: String
    let imageUrl: String
}

struct OrderRequestModel: Codable {
    let comapnyName: String
    let companyPhone: String
    let numberOfNFCStickers: Int
    let companyID: String
}
