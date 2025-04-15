//
//  OrderView.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 13/04/25.
//

import SwiftUI

struct OrderView: View {
    @StateObject private var viewModel = OrderViewModel()
    let provider: ServiceProvider
    @State private var phoneNumberText: String = ""
    @State private var numberOfStickersText: String = ""
    @Environment(\.dismiss) private var dismiss
    @State private var navigate = false
    @Binding var rootPresenting: Bool
    @FocusState private var focusedField: Field?
    
    private var isButtonEnabled: Bool {
        viewModel.isTextFieldsValid(phoneText: phoneNumberText, numberOfStickers: numberOfStickersText)
    }
    
    private enum Field: Hashable {
        case phoneNumber
        case numberOfStickers
    }
    
    var body: some View {
        ZStack {
            Color.customBackground
                .ignoresSafeArea()
                .contentShape(Rectangle())
                .onTapGesture {
                    focusedField = nil
                }
            
            VStack(spacing: 20) {
                Image(provider.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 80)
                
                Text(provider.name)
                    .font(.headline)
                    .foregroundColor(.gray)
                
                HStack {
                    Text("Phone number")
                        .font(.headline)
                        .foregroundColor(.gray)
                    Spacer()
                }
                
                HStack(spacing: 4) {
                    Text("+998")
                        .foregroundColor(.primary)
                        .padding(.leading, 10)
                    
                    TextField("Phone number", text: $phoneNumberText)
                        .keyboardType(.numberPad)
                        .disableAutocorrection(true)
                        .foregroundColor(.primary)
                        .textFieldStyle(.plain)
                        .textContentType(.telephoneNumber)
                        .submitLabel(.next)
                        .focused($focusedField, equals: .phoneNumber)
                        .onChange(of: phoneNumberText) { newValue in
                            let cleaned = newValue.filter { $0.isNumber }
                            if cleaned.count > 9 {
                                phoneNumberText = viewModel.formatPhoneNumber(String(cleaned.prefix(9)))
                            } else {
                                phoneNumberText = viewModel.formatPhoneNumber(cleaned)
                            }
                        }
                        .onSubmit {
                            focusedField = .numberOfStickers
                        }
                }
                .frame(height: 54)
                .padding(.horizontal, 5)
                .background(Color(.systemBackground))
                .cornerRadius(10)
                
                HStack {
                    Text("Number of NFC stickers")
                        .font(.headline)
                        .foregroundColor(.gray)
                    Spacer()
                }
                
                VStack(spacing: 4) {
                    TextField("Number of NFC stickers", text: $numberOfStickersText)
                        .keyboardType(.numberPad)
                        .foregroundColor(.primary)
                        .padding()
                        .background(Color(.systemBackground))
                        .cornerRadius(10)
                        .submitLabel(.done)
                        .focused($focusedField, equals: .numberOfStickers)
                        .frame(height: 54)
                        .onSubmit {
                            focusedField = nil
                        }
                        .onChange(of: numberOfStickersText) { newValue in
                            let filtered = newValue.filter { $0.isNumber }
                            if filtered.count <= 3 {
                                numberOfStickersText = filtered
                            } else {
                                numberOfStickersText = String(filtered.prefix(3))
                            }
                        }
                    
                    if viewModel.showWarningText(numberOfStickersText) {
                        HStack(alignment: .center, spacing: 8) {
                            Image(systemName: "exclamationmark.circle")
                                .resizable()
                                .foregroundColor(.red)
                                .frame(width: 22, height: 22)
                            
                            Text("The number of NFC stickers must be between 1 and 100.")
                                .font(.system(size: 10))
                                .foregroundColor(.red)
                        }
                        .padding(.top, 10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                    }
                }
                .animation(.easeInOut(duration: 0.3), value: viewModel.showWarningText(numberOfStickersText))
                
                Spacer()
                
                Button {
                    navigate = true
                } label: {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(isButtonEnabled ? .white : .buttonTextDisabled)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 15)
                        .background(isButtonEnabled ? .main : .buttonBgDisabled)
                        .cornerRadius(12)
                }
                .frame(height: 54)
                .disabled(!isButtonEnabled)
                
                NavigationLink(
                    destination: SuccessView(rootPresenting: $rootPresenting),
                    isActive: $navigate
                ) {
                    EmptyView()
                }
            }
            .padding(.horizontal)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss() 
                    } label: {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.gray)
                            .font(.system(size: 20, weight: .bold))
                    }
                }
            }
        }
    }
}
