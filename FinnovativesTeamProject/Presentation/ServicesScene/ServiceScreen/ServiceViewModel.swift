//
//  ServiceViewModel.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 13/04/25.
//

import Foundation

class ServiceViewModel: ObservableObject {
    @Published private(set) var services: [ServiceModel] = []
    
    init() {
        services = ServiceType.allCases.map { type in
            ServiceModel(
                imageString: type.imageString,
                title: type.title,
                subtitle: type.subtitle,
                type: type
            )
        }
    }
}
