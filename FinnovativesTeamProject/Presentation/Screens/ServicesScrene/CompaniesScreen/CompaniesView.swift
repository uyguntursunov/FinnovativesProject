//
//  CompaniesView.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 13/04/25.
//

import SwiftUI

struct CompaniesView: View {
    @StateObject private var viewModel = CompaniesViewModel()
    @Binding var rootPresenting: Bool
    @FocusState private var isSearchFieldFocused: Bool
    
    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    var body: some View {
        ZStack{
            Color.background
                .ignoresSafeArea()
                .contentShape(Rectangle())
                .onTapGesture {
                    if isSearchFieldFocused {
                        isSearchFieldFocused = false
                    }
                }
            VStack(spacing: 0) {
                
                searchBar
                
                VStack {
                    HStack {
                        companiesTitle
                        Spacer()
                        numberOfBusinessText
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(viewModel.filteredServiceProviders) { provider in
                                NavigationLink(destination:
                                                OrderView(provider: provider,
                                                          rootPresenting: $rootPresenting)
                                )
                                {
                                    CompanyCellView(company: provider)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("order_nfc_sticker".localized)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading, content: {
                    Button {
                        rootPresenting = false
                    } label: {
                        Image(systemName: IS.chevronBackward)
                            .foregroundColor(.gray)
                            .font(.system(size: 20, weight: .bold))
                    }
                })
            }
        }
    }
}

extension CompaniesView {
    private var searchBar: some View {
        HStack(spacing: 5) {
            Image(systemName: IS.magnifyingglass)
                .foregroundStyle(.gray)
                .padding(.leading, 20)
            
            TextField("search".localized, text: $viewModel.searchText)
                .focused($isSearchFieldFocused)
                .padding(.leading, 3)
                .cornerRadius(10)
                .submitLabel(.done)
                .disableAutocorrection(true)
                .onSubmit {
                    isSearchFieldFocused = false
                }
                        
            if !viewModel.searchText.isEmpty {
                Button(action: {
                    viewModel.searchText = ""
                    isSearchFieldFocused = true
                }) {
                    Image(systemName: IS.xmarkCircleFill)
                        .foregroundStyle(.gray)
                        .padding(.trailing, 8)
                }
            }
        }
        .frame(height: 54)
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .padding(.horizontal)
    }
    
    private var companiesTitle: some View {
        Text("select_your_business".localized)
            .font(.headline)
            .foregroundColor(.primary)
    }
    
    private var numberOfBusinessText: some View {
        Text("\(viewModel.filteredServiceProviders.count)")
            .font(.subheadline)
            .foregroundColor(.gray)
    }
}


