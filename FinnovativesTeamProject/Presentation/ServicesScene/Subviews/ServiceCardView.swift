//
//  ServiceCard.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 13/04/25.
//

import SwiftUI

struct ServiceCardView: View {
    let service: Service
    
    var body: some View {
        HStack {
            // Service image
            Image(systemName: service.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(Color.main)
                .padding(10)
                .padding(5)
            
            // Service image and subtitle
            VStack(alignment: .leading, spacing: 5){
                Text(service.title)
                    .font(.callout)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                
                if !service.subtitle.isEmpty {
                    Text(service.subtitle)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .lineLimit(2)
                }
            }
            .padding(.vertical, 10)
            
            Spacer()
        }
        .frame(height: 90)
        .background(.serviceCardBg)
        .cornerRadius(10)
    }
}
