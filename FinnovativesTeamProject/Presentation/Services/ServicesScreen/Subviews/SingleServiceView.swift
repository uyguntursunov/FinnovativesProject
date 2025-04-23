//
//  SingleServiceView.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 13/04/25.
//

import SwiftUI

struct SingleServiceView: View {
    let service: Service
    
    var body: some View {
        HStack {
            serviceIcon
            
            VStack(alignment: .leading, spacing: 5){
                serviceTitle
                
                if !service.subtitle.rawValue.isEmpty {
                    serviceSubtitle
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

extension SingleServiceView {
    private var serviceIcon: some View {
        Image(uiImage: service.image!)
            .resizable()
            .scaledToFit()
            .frame(width: 30, height: 30)
            .foregroundColor(.main)
            .padding(15)
    }
    
    private var serviceTitle: some View {
        Text(service.title.rawValue)
            .font(.callout)
            .foregroundColor(.primary)
            .lineLimit(2)
    }
    
    private var serviceSubtitle: some View {
        Text(service.subtitle.rawValue)
            .font(.subheadline)
            .foregroundColor(.gray)
            .lineLimit(2)
    }
}
