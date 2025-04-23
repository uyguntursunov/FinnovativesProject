//
//  CompanyCellView.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 13/04/25.
//

import SwiftUI

struct CompanyCellView: View {
   
    @StateObject var vm: ServiceProviderCardViewModel
    
    init(company: CompanyModel) {
        _vm = StateObject(wrappedValue: ServiceProviderCardViewModel(company: company))
    }
    
    var body: some View {
        VStack { if let image = vm.image {
                Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .padding()
            } else if vm.isLoading {
                ProgressView()
                    .frame(width: 80, height: 80)
            } else {
                Image(systemName: IS.questionmark.rawValue)
                    .resizable()
                    .frame(width: 80, height: 80)
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
    }
}
