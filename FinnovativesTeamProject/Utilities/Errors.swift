//
//  Errors.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 28/04/25.
//

import Foundation

enum ContentFetchErrorMessage {
    static let contentFetchErrorMessage = "content_fetch_error_message".localized
    static let eventFetchErrorMessage = "event_fetch_error_message".localized
    static let finServiceFetchErrorMessage = "fin_service_fetch_error_message".localized
    static let payForServiceFetchErrorMessage = "pay_for_service_fetch_error_message".localized
}

enum FileManagerErrorMessage {
    static let saveImageError = "save_image_error".localized
    static let createDirectoryError = "create_directory_error".localized
}

enum NetworkManagerErrorMessage {
    static let encodingError = "encoding_error".localized
    static let requestError = "request_error".localized
    static let getCompanyImageError = "get_company_image_error".localized
    static let fetchCompaniesError = "fetch_companies_error".localized
}
