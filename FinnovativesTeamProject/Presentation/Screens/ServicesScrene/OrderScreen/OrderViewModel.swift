//
//  OrderViewModel.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 13/04/25.
//

import Foundation

class OrderViewModel: ObservableObject {
    let orderStickerUseCase: OrderStickerUseCaseProtocol
    let orderRequestUiTileMapper: OrderRequestUiTileMapperProtocol
    
    init(orderStickerUseCase: OrderStickerUseCaseProtocol = OrderStickersUseCase(),
         orderRequestUiTileMapper: OrderRequestUiTileMapperProtocol = OrderRequestUiTileMapper()) {
        self.orderStickerUseCase = orderStickerUseCase
        self.orderRequestUiTileMapper = orderRequestUiTileMapper
    }
    
    func isTextFieldsValid(phoneText: String, numberOfStickers: String) -> Bool {
        let digitsOnly = phoneText.filter { $0.isNumber }
        let isPhoneTextFieldValid = digitsOnly.count == 9
        let isStickersTextFieldValid = validateNumberOfStickers(numberOfStickers)
        
        return isPhoneTextFieldValid && isStickersTextFieldValid
    }
    
    func validateNumberOfStickers(_ numberOfStickers: String) -> Bool {
        guard let number = Int(numberOfStickers), numberOfStickers.allSatisfy({ $0.isNumber }) else {
            return false
        }
        return number >= 1 && number <= 100
    }
    
    func showWarningText(_ numberOfStickers: String) -> Bool {
        return !validateNumberOfStickers(numberOfStickers) && !numberOfStickers.isEmpty
    }
    
    func formatPhoneNumber(_ number: String) -> String {
        let cleanNumber = number.filter { $0.isNumber }
        
        var result = ""
        let maxLength = 9
        let limited = String(cleanNumber.prefix(maxLength))
        
        for (index, digit) in limited.enumerated() {
            if index == 2 || index == 5 || index == 7 {
                result.append(" ")
            }
            result.append(digit)
        }
        return result
    }
    
    func postOrder(model: OrderRequestUiTile, completion: @escaping (Bool) -> Void) {
        let entity = orderRequestUiTileMapper.map(model)
        orderStickerUseCase.execute(entity: entity) { result in
            completion(result)
        }
    }
}
