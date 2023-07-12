//
//  CountryCardsSwipeView.swift
//  FlagsSwiftUI
//
//  Created by Justus Aype Jose on 10/07/23.
//

import SwiftUI

struct CountryCardsSwipeView: View {
    
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
                        
                        ZStack {
                            ForEach(countriesInCards(), id: \.name) { country in
//                                NavigationLink {
//                                    CountryFlagCardsView(viewModel: CountryFlagCardViewModel(country: country))
//                                } label: {
                                    CountryCard(country: country)
//                                }
                            }
                        }
                        .padding(.all)
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
            .navigationTitle("navigationTitleCountriesSwipe")
            .background(background)
            .toolbar(.visible, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

private extension CountryCardsSwipeView {
    
    var navigationBarGradient: some View {
        Rectangle()
            .fill(Color.clear)
            .frame(height: 10)
            .background(LinearGradient(colors: [.green.opacity(0.3), .blue.opacity(0.8)],
                                       startPoint: .leading, endPoint: .trailing)
            )
    }
    
    var background: some View {
        LinearGradient(colors: [.black.opacity(0.3), .blue.opacity(0.8)],
                                   startPoint: .top, endPoint: .bottom)
    }
    
    func countriesInCards() -> [Country] {
        if viewModel.countries.reversed().count > 1 {
            return Array(viewModel.countries.reversed()[0..<10])
        } else {
            return []
        }
    }
    
    func displayNextTenCountries(allCountries: [Country], displayedCountries: inout [Country]) {
        guard displayedCountries.count < allCountries.count else {
            // All countries have been displayed
            return
        }
        let startIndex = displayedCountries.count
        let endIndex = min(startIndex + 10, allCountries.count)
        let newCountries = Array(allCountries[startIndex..<endIndex])
        displayedCountries.append(contentsOf: newCountries)
    }
    
}


struct CountryCardsSwipeView_Previews: PreviewProvider {
    static var previews: some View {
        CountryCardsSwipeView()
    }
}
