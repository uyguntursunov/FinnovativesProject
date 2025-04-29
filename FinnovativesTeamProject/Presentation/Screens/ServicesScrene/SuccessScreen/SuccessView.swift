//
//  SuccessView.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 13/04/25.
//

import SwiftUI

struct SuccessView: View {
    @State private var animate = false
    @Binding var rootPresenting: Bool
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                checkmarkImage
                
                successText
                
                detailedSuccessText
                
                Spacer()
                
                VStack {
                    Image(systemName: IS.chevronBackward)
                        .foregroundColor(.gray)
                        .font(.system(size: 24, weight: .bold))
                    
                    Text("return_to_app".localized)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding()
                }
                
                .onTapGesture {
                    rootPresenting = false
                }
            }
            
        }
        .onAppear {
            animate = true
        }
        .navigationBarBackButtonHidden()
    }
}

extension SuccessView {
    private var checkmarkImage: some View {
        Circle()
            .overlay(
                Image("checkmarkLogo")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
                    .rotationEffect(.degrees(animate ? 0 : -180))
                    .opacity(animate ? 1 : 0)
                    .animation(.easeOut(duration: 0.6), value: animate)
            )
            .foregroundStyle(.main)
            .frame(width: 85, height: 85)
    }
    
    private var successText: some View {
        Text("success".localized)
            .font(.title3.bold())
    }
    
    private var detailedSuccessText: some View {
        Text("success_message".localized)
            .multilineTextAlignment(.center)
            .foregroundColor(.gray)
            .padding()
    }
}
