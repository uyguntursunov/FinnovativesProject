//
//  ServiceProvidersView.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 13/04/25.
//

import SwiftUI

struct ServiceProvidersView: View {
    @StateObject private var viewModel = ServiceProviderViewModel()
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
                        // Grid of Serices
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(viewModel.filteredServiceProviders) { provider in
                                NavigationLink(destination:
                                                OrderView(provider: provider,
                                                          rootPresenting: $rootPresenting)
                                )
                                {
                                    ServiceProviderCard(company: provider)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Order NFC sticker")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading, content: {
                    Button {
                        rootPresenting = false
                    } label: {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.gray)
                            .font(.system(size: 20, weight: .bold))
                    }
                })
            }
        }
    }
}

extension ServiceProvidersView {
    private var searchBar: some View {
        HStack(spacing: 5) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.gray)
                .padding(.leading, 20)
            
            TextField("Search", text: $viewModel.searchText)
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
                    Image(systemName: "xmark.circle.fill")
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
        Text("Select your business")
            .font(.headline)
            .foregroundColor(.primary)
    }
    
    private var numberOfBusinessText: some View {
        Text("\(viewModel.filteredServiceProviders.count)")
            .font(.subheadline)
            .foregroundColor(.gray)
    }
}


