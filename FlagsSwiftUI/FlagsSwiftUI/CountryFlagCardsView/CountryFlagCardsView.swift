//
//  FlagCardsView.swift
//  FlagsSwiftUI
//
//  Created by Justus Aype Jose on 05/07/23.
//

import SwiftUI

struct CountryFlagCardsView: View {
    
    @ObservedObject var viewModel: CountryFlagCardViewModel
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: viewModel.flag)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                @unknown default:
                    EmptyView()
                }
            }
            .padding()
            
            List {
                ForEach(viewModel.valuesToShow(), id: \.0) { tuple in
                    KeyValueCell(key: "\(tuple.0)", value: "\(tuple.1)")
                }
            }
        }
        .navigationTitle("navigationTitleFlagDetails")
    }
}

struct CountryFlagCardsView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleCountry = Country(name: Name(common: "Jordan", official: "Hashemite Kingdom of Jordan", nativeName: ["ara": NativeName(official: "المملكة الأردنية الهاشمية", common: "الأردن")]), tld: [".jo", "الاردن."], cca2: "JO", ccn3: "400", cca3: "JOR", cioc: "JOR", independent: true, status: "officially-assigned", unMember: true, currencies: ["JOD": Currency(name: "Jordanian dinar", symbol: "د.ا")], idd: Idd(root: "+9", suffixes: ["62"]), capital: ["Amman"], altSpellings: ["JO", "Hashemite Kingdom of Jordan", "al-Mamlakah al-Urdunīyah al-Hāshimīyah"], region: "Asia", subregion: "Western Asia", languages: ["ara": "Arabic"], translations: Translations(ara: NativeName(official: "المملكة الأردنية الهاشمية", common: "الأردن"), bre: nil, ces: nil), latlng: [31.0, 36.0], landlocked: false, borders: ["IRQ", "ISR", "PSE", "SAU", "SYR"], area: 89342.0, demonyms: ["eng": Demonym(f: "Jordanian", m: "Jordanian"), "fra": Demonym(f: "Jordanienne", m: "Jordanien")], flag: "", maps: Maps(googleMaps: "", openStreetMaps: ""), population: 10203140, gini: ["2010": 33.7], fifa: "JOR", car: Car(signs: ["HKJ"], side: "right"), timezones: ["UTC+03:00"], continents: ["Asia"], flags: Flags(png: "https://flagcdn.com/w320/jo.png", svg: "", alt: ""), coatOfArms: CoatOfArms(png: "https://mainfacts.com/media/images/coats_of_arms/jo.png", svg: ""), startOfWeek: "sunday", capitalInfo: CapitalInfo(latlng: [31.95, 35.93]), postalCode: PostalCode(format: "#####", regex: "^(\\d{5})$"))
        
        NavigationView {
            CountryFlagCardsView(viewModel: CountryFlagCardViewModel(country: sampleCountry))
        }
    }
}

