//
//  NetworkManager.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 21/04/25.
//

import Foundation
import Combine

class NetworkManager {
    
    @Published var companies: [CompanyModel] = []
    
    var companySubscribtion: AnyCancellable?
    
    init() {
        getCompanies()
    }
    
    //MARK: Get request
    func getCompanies() {
        let companiesURL = "https://67f606e7913986b16fa65016.mockapi.io/Businesses"
        guard let url = URL(string: companiesURL) else { return }
        
        companySubscribtion = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .receive(on: DispatchQueue.main)
        
            .tryMap { (output) -> Data in
                
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .decode(type: [CompanyModel].self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] (returnedCompanies) in
                self?.companies = returnedCompanies
                self?.companySubscribtion?.cancel()
            }
        
    }
    
    //MARK: Post request
    func postOrder(company: CompanyModel, phoneNumber: String, numberOfNFCStickers: String, completion: @escaping (Bool) -> Void) {
        guard let numberOfStickers = Int(numberOfNFCStickers) else {
            completion(false)
            return
        }
        
        let order = OrderRequestModel(
            comapnyName: company.name,
            companyPhone: phoneNumber,
            numberOfNFCStickers: numberOfStickers,
            companyID: company.id)
        
        guard let url = URL(string: "https://67f606e7913986b16fa65016.mockapi.io/NFCStickerRequests") else {
            completion(false)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField:  "Content-Type")
        
        do {
            request.httpBody = try JSONEncoder().encode(order)
        } catch {
            print("Encoding error: \(error.localizedDescription)")
            completion(false)
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Request error: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                    print("Invalid response")
                    completion(false)
                    return
                }
                
                completion(true)
            }
        }.resume()
    }
    
    
}

