//
//  FetchPaymentForServicesUseCase.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 26/04/25.
//

import Foundation

protocol FetchPaymentForServicesUseCaseProtocol {
    func execute(_ completion: @escaping ([PaymentForServiceEntity]) -> Void)
}

final class FetchPaymentForServicesUseCase: FetchPaymentForServicesUseCaseProtocol {
    let paymentForServiceRepository: PaymentForServiceRepositoryProtocol
    
    init(
        paymentForServiceRepository: PaymentForServiceRepositoryProtocol = PaymentForServiceRepository()
    ) {
        self.paymentForServiceRepository = paymentForServiceRepository
    }
    
    func execute(_ completion: @escaping ([PaymentForServiceEntity]) -> Void) {
        paymentForServiceRepository.fetchPaymentForServices { result in
            switch result {
            case .success(let data):
                completion(data)
            case .failure(let error):
                print(ContentFetchErrorMessage.payForServiceFetchErrorMessage + error.localizedDescription)
            }
        }
    }
}
