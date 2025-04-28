//
//  Errors.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 28/04/25.
//

import Foundation

enum ContentFetchErrorMessage {
    static let contentFetchErrorMessage = "contentFetchErrorMessage".localized
    static let eventFetchErrorMessage = "eventFetchErrorMessage".localized
    static let finServiceFetchErrorMessage = "finServiceFetchErrorMessage".localized
    static let payForServiceFetchErrorMessage = "payForServiceFetchErrorMessage".localized
}

enum FileManagerErrorMessage {
    static let saveImageError = "saveImageError".localized
    static let createDirectoryError = "createDirectoryError".localized
}

enum NetworkManagerErrorMessage {
    static let encodingError = "encodingError".localized
    static let requestError = "requestError".localized
    static let getCompanyImageError = "getCompanyImageError".localized
    static let fetchCompaniesError = "fetchCompaniesError".localized
}
