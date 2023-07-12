//
//  CountryCardsSwipeViewModel.swift
//  FlagsSwiftUI
//
//  Created by Justus Aype Jose on 10/07/23.
//

import Foundation

@MainActor
class CountryCardsSwipeViewModel: ObservableObject {
    
    @Published var country: Country
    
    init(country: Country) {
        self.country = country
    }
    
    var flag: String {
        if let flag = country.flags?.png {
            return flag
        }
        return placeholderPathFlag ?? ""
    }
    
    
    func valuesToShow() -> [(String, String)] {
        return [
            ("titleCountry", countryName),
            ("titleLanguages", languages),
            ("titleCurrencies", currency),
            ("titleCapital", capital),
            ("titlePopulation", population)
        ]
    }
    
    private var countryName: String {
        country.name?.common ?? "placeholderCountry"
    }
    private var capital: String {
        country.capital?.first ?? "placeholderCapital"
    }
    private var population: String {
        String(country.population ?? 0)
    }
    
    private var currency: String {
        if let currencies = country.currencies, let list = Array(currencies.values) as? Array<Currency>, let names = Array(list.map{ $0.name }) as? Array<String> {
            return names.joined(separator: ",")
        }
        return String("placeholderCurrency")
    }
    
    private var languages: String {
        if let languages = country.languages, let list = Array(languages.values) as? Array<String> {
            return list.joined(separator: ",")
        }
        return String("placeholderLanguage")
    }
}
