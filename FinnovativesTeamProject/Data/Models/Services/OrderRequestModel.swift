//
//  OrderRequestModel.swift
//  FinnovativesTeamProject
//
//  Created by Uyg'un Tursunov on 29/04/25.
//

import Foundation

struct OrderRequestModel: Codable {
    let comapnyName: String
    let companyPhone: String
    let numberOfNFCStickers: Int
    let companyID: String
}
