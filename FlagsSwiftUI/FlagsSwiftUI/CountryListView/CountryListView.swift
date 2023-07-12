//
//  CountryListView.swift
//  FlagsSwiftUI
//
//  Created by Justus Aype Jose on 05/07/23.
//

import SwiftUI

struct CountryListView: View {
    @StateObject private var viewModel = CountryViewModel()

    var body: some View {
        
        NavigationStack {
            
            ZStack {
                Color.green
                    .opacity(0.1)
                    .ignoresSafeArea()
                
                VStack {
                    navigationBarGradient
                    
                    ScrollView(showsIndicators: false) {
                        LazyVStack {
                            ForEach(viewModel.countries, id: \.name) { country in
                                NavigationLink {
                                    CountryFlagCardsView(viewModel: CountryFlagCardViewModel(country: country))
                                } label: {
                                    CountryCell(country: country)
                                }
                            }
                        }
                        .padding(.horizontal)
                        .task {
                            viewModel.loadCountries()
                        }
                        .alert("", isPresented: $viewModel.isError) {} message: {
                            Text("Data load failed!")
                        }
                    }
                    .padding(.top, -10)
                    Spacer()
                }
            }
            .toolbar(.visible, for: .tabBar)
            .toolbarBackground(Color("NavigationBackground"), for: .navigationBar)
            .navigationTitle("navigationTitleCountriesList")
            .background(LinearGradient(colors: [.blue.opacity(0.3), .green.opacity(0.8)],
                                       startPoint: .top, endPoint: .bottom))
            .toolbar(.visible, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

private extension CountryListView {
    
    var navigationBarGradient: some View {
        Rectangle()
            .fill(Color.clear)
            .frame(height: 10)
            .background(LinearGradient(colors: [.green.opacity(0.3), .blue.opacity(0.8)],
                                       startPoint: .leading, endPoint: .trailing)
            )
    }
    
    var background: some View {
        LinearGradient(colors: [.blue.opacity(0.3), .green.opacity(0.8)],
                                   startPoint: .top, endPoint: .bottom)
    }
}


struct CountryListView_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView()
    }
}
