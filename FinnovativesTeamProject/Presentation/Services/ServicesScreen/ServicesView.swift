//
//  ServicesView.swift
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
                    if service.type == .nfcSticker
                    {
                        NavigationLink(
                            destination:
                                CompaniesView(rootPresenting: $rootPresenting)
                            ,
                            isActive: $rootPresenting
                        ){
                            SingleServiceView(service: service)
                        }
                    } else {
                        SingleServiceView(service: service)
                    }
                }
            }
            .padding()
        }
        .background(Color.background)
        .navigationTitle("Services")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ServicesView()
}
