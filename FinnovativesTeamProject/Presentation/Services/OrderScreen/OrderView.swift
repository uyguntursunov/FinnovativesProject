//
//  OrderView.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 13/04/25.
//

import SwiftUI

struct OrderView: View {
    @StateObject private var viewModel = OrderViewModel()
    
    let provider: CompanyModel
    
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
            Color.background
                .ignoresSafeArea()
                .contentShape(Rectangle())
                .onTapGesture {
                    focusedField = nil
                }
            
            VStack(spacing: 20) {
                companyImage
                
                companyName
                
                phoneNumberTextFieldTitle
                
                phoneNumberTextField
                
                numberOfNFCTextFieldTitle
                
                VStack(spacing: 4) {
                    
                    numberOfNFCTextField
                    
                    
                    if viewModel.showWarningText(numberOfStickersText) {
                        warningTextWithImage
                    }
                }
                .animation(.easeInOut(duration: 0.3), value: viewModel.showWarningText(numberOfStickersText))
                
                Spacer()
                
                nextButton
                
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

extension OrderView {
    private var companyImage: some View {
        AsyncImage(url: URL(string: provider.imageUrl)) { image in
            image
                .resizable()
                .scaledToFit()
                .background(.white)
                .frame(width: 100, height: 80)
                .cornerRadius(8)
        } placeholder: {
            ProgressView()
                .background(.white)
                .frame(width: 100, height: 80)
        }
        
    }
    
    private var companyName: some View {
        Text(provider.name)
            .font(.headline)
            .foregroundColor(.gray)
    }
    
    private var phoneNumberTextFieldTitle: some View {
        HStack {
            Text("Phone number")
                .font(.headline)
                .foregroundColor(.gray)
            Spacer()
        }
    }
    
    private var phoneNumberTextField: some View {
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
    }
    
    private var numberOfNFCTextFieldTitle: some View {
        HStack {
            Text("Number of NFC stickers")
                .font(.headline)
                .foregroundColor(.gray)
            Spacer()
        }
    }
    
    private var numberOfNFCTextField: some View {
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
    }
    
    private var warningTextWithImage: some View {
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
    
    private var nextButton: some View {
        Button {
            guard let numberOfStickers = Int(numberOfStickersText) else { return }
            let model = OrderRequestModel(comapnyName: provider.name,
                                          companyPhone: phoneNumberText,
                                          numberOfNFCStickers: numberOfStickers,
                                          companyID: provider.id)
            
            viewModel.postOrder(model: model) { success in
                if success {
                    navigate = true
                } else {
                    print("Failed to send order")
                }
            }
        } label: {
            Text("Confirm")
                .font(.headline)
                .foregroundColor(isButtonEnabled ? .white : .disabledButtonText)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 15)
                .background(isButtonEnabled ? .main : .disabledButtonBg)
                .cornerRadius(12)
        }
        .frame(height: 54)
        .disabled(!isButtonEnabled)
    }
}
