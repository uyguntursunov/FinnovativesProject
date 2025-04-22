//
//  API.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 22/04/25.
//

import Foundation

internal let BASE_URL = "https://67f606e7913986b16fa65016.mockapi.io/"

final class API {
    static let shared = API()
    
    // Businesses
    let API_URL_BUSINESSES = BASE_URL + "Businesses"
    
    // Order requestes
    let API_URL_REQUESTES = BASE_URL + "NFCStickerRequests"
}

extension API {
    func getCompanies(completion: @escaping (Result<[CompanyModel], Error>) -> Void) {
        guard let url = URL(string: API_URL_BUSINESSES) else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let results = try JSONDecoder().decode([CompanyModel].self, from: data)
                completion(.success(results))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
