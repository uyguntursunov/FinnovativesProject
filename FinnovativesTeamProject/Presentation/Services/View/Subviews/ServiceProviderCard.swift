//
//  SwiftUIView.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 13/04/25.
//

import SwiftUI

struct ServiceProviderCard: View {
    let provider: ServiceProvider
    
    var body: some View {
        VStack {
            Image(provider.logo)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
    }
}
