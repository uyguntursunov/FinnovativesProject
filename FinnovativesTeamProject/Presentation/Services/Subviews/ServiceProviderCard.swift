//
//  SwiftUIView.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 13/04/25.
//

import SwiftUI

struct ServiceProviderCard: View {
    let provider: CompanyModel
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: provider.imageUrl)) { image in
                image
                    .resizable() 
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .padding()
            } placeholder: {
                ProgressView()
                    .frame(width: 80, height: 80)
                    .padding()
            }

        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
    }
}
