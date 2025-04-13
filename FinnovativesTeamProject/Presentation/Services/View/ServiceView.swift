//
//  ServiceView.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 13/04/25.
//

import SwiftUI

struct ServicesView: View {
    @StateObject private var viewModel = ServiceViewModel()
    @State private var rootPresenting = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(viewModel.services) { service in
                    if service.title == "Order NFC sticker" {
                        NavigationLink(
                            destination:
                                ServiceProvidersView(rootPresenting: $rootPresenting)
                            ,
                            isActive: $rootPresenting
                        ){
                            ServiceCardView(service: service)
                        }
                    } else {
                        ServiceCardView(service: service)
                    }
                }
            }
            .padding()
        }
        .background(Color.customBackground)
        .navigationTitle("Services")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ServicesView()
}
