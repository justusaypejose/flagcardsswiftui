//
//  Country.swift
//  FlagsSwiftUI
//
//  Created by Justus Aype Jose on 05/07/23.
//

import Foundation

struct Countries: Codable {
    var results: [Country]?
}

struct Country: Codable {
    let name: Name?
    let tld: [String]?
    let cca2: String?
    let ccn3: String?
    let cca3: String?
    let cioc: String?
    let independent: Bool?
    let status: String?
    let unMember: Bool?
    let currencies: [String: Currency]?
    let idd: Idd?
    let capital: [String]?
    let altSpellings: [String]?
    let region: String?
    let subregion: String?
    let languages: [String: String]?
    let translations: Translations?
    let latlng: [Double]?
    let landlocked: Bool?
    let borders: [String]?
    let area: Double?
    let demonyms: [String: Demonym]?
    let flag: String?
    let maps: Maps?
    let population: Int?
    let gini: [String: Double]??
    let fifa: String?
    let car: Car?
    let timezones: [String]?
    let continents: [String]?
    let flags: Flags?
    let coatOfArms: CoatOfArms?
    let startOfWeek: String?
    let capitalInfo: CapitalInfo?
    let postalCode: PostalCode?
}

struct Name: Codable, Hashable {
    static func == (lhs: Name, rhs: Name) -> Bool {
        return lhs.common == rhs.common
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(common)
        hasher.combine(official)
    }
    let common: String?
    let official: String?
    let nativeName: [String: NativeName]?
}

struct NativeName: Codable {
    let official: String?
    let common: String?
}

struct Currency: Codable {
    let name: String?
    let symbol: String?
}

struct Idd: Codable {
    let root: String?
    let suffixes: [String]?
}

struct Translations: Codable {
    let ara: NativeName?
    let bre: NativeName?
    let ces: NativeName?
    // ... other translation properties
}

struct Demonym: Codable {
    let f: String?
    let m: String?
}

struct Maps: Codable {
    let googleMaps: String?
    let openStreetMaps: String?
}

struct Car: Codable {
    let signs: [String]?
    let side: String?
}

struct Flags: Codable {
    let png: String?
    let svg: String?
    let alt: String?
}

struct CoatOfArms: Codable {
    let png: String?
    let svg: String?
}

struct CapitalInfo: Codable {
    let latlng: [Double]?
}

struct PostalCode: Codable {
    let format: String?
    let regex: String?
}
