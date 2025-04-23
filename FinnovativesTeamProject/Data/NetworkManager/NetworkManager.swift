//
//  NetworkManager.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 22/04/25.
//

import Foundation

internal let BASE_URL = "https://67f606e7913986b16fa65016.mockapi.io/"

final class NetworkManager {
    static let shared = NetworkManager()
    
    // Businesses
    let API_URL_BUSINESSES = BASE_URL + "Businesses"
    
    // Order requestes
    let API_URL_REQUESTS = BASE_URL + "NFCStickerRequests"
}

// MARK: - GET COMPANIES
extension NetworkManager {
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

// MARK: - POST ORDER
extension NetworkManager {
    func postOrder(model: OrderRequestModel, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: API_URL_REQUESTS) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField:  "Content-Type")
        
        let order = OrderRequestModel(
            comapnyName: model.comapnyName,
            companyPhone: model.companyPhone,
            numberOfNFCStickers: model.numberOfNFCStickers,
            companyID: model.companyID
        )
        
        do {
            request.httpBody = try JSONEncoder().encode(order)
        } catch {
            print("Encoding error: \(error.localizedDescription)")
            completion(false)
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { _, _, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Request error: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                completion(true)
            }
        }
        task.resume()
    }
}

// MARK: - GET COMPANY IMAGES
extension NetworkManager {
    func getCompanyImage(url: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
