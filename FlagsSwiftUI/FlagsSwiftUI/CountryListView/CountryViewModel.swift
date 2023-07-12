//
//  CountryViewModel.swift
//  FlagsSwiftUI
//
//  Created by Justus Aype Jose on 05/07/23.
//

import Foundation

@MainActor
class CountryViewModel: ObservableObject {
    
    @Published var countries: [Country] = [Country]()
    @Published var isError: Bool = false
    @Published var isLoading: Bool = false
        
    var service: APIService?
    
    init(service: APIService = APIService()) {
        self.service = service
    }
    
    func loadCountries() {
        
        self.isLoading = true
        guard let service else {
            self.isError = true
            self.isLoading = false
            return
        }
        
        Task {
            do {
                let response = try await service.fetch(type: [Country].self, serviceType: .countries)
                self.isLoading = false
                guard let response else {
                    self.isError = true
                    self.isLoading = false
                    return
                }
                countries = response.compactMap { $0 }
            } catch {
                self.isError = true
            }
        }
    }
}
