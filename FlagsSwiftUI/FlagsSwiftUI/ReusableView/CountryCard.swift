//
//  CountryCard.swift
//  FlagsSwiftUI
//
//  Created by Justus Aype Jose on 10/07/23.
//

import SwiftUI

struct CountryCard: View {
    
    var country: Country
    @State private var offset: CGSize = .zero
    @State private var color: Color = .white
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .fill(
                    LinearGradient(gradient: Gradient(colors: [Color.white, Color.black]),
                                   startPoint: .top,
                                   endPoint: .bottom))
                .frame(width: UIScreen.screenWidth - 60, height: 300)
                .border(.white, width: 10)
                .cornerRadius(10)
                .shadow(radius: 5)
                .foregroundColor(color.opacity(0.8))

            VStack(spacing: 16) {
                AsyncImage(url: URL(string: country.flags?.png ?? "")) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(16)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(16)
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(width: 200, height: 100)
                
                VStack(spacing: 8) {
                    Text(country.name?.common ?? "countryname")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .lineLimit(3)
                        .fixedSize(horizontal: false, vertical: true)

                    Text(country.capital?.first ?? "Capital")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .lineLimit(3)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .foregroundColor(.white)
                
            }
            .padding()
        }
        .frame(width: UIScreen.screenWidth - 40, height: UIScreen.screenHeight - 100, alignment: .center)
        .shadow(radius: 10)
        .cornerRadius(16)
        .offset(x: offset.width, y: offset.height * 0.5)
        .rotationEffect(.degrees(Double(offset.width / 50)))
        .gesture(
            DragGesture()
                .onChanged({ gesture in
                    offset = gesture.translation
                })
                .onEnded({ gesture in
                    
                    switch (offset.width) {
                    case -500...(-100):
                        offset = .init(width: -500, height: 0)
                        color = .red
                    case 200...500:
                        offset = .init(width: 500, height: 0)
                        color = .green
                    default:
                        offset = .zero
                        color = .black
                    }
                    
                })
        
        )
    }
}


private extension CountryCard {
    

    @ViewBuilder func nameImageSection() -> some View {
        HStack {
            flagImage()
            nameLabel()
            Spacer()
        }
        .padding(.top, 5)
        .padding(.bottom, 5)
    }
    
    @ViewBuilder func flagImage() -> some View {
        AsyncImage(url: URL(string: country.flags?.png ?? "")) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(height: 40, alignment: .trailing)
                .aspectRatio(contentMode: .fit)
                .clipped()
                .cornerRadius(10)
        } placeholder: {
            ProgressView()
                .frame(width: 40, height: 40, alignment: .trailing)
        }
    }
    
    @ViewBuilder func nameLabel() -> some View {
        Text(country.name?.common ?? "countryname")
            .font(.system(size: 16, weight: .semibold))
            .multilineTextAlignment(.leading)
            .lineLimit(3)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.trailing, 10)
    }
    
    @ViewBuilder func detailLabelsSection() -> some View {
        
    }
}

struct CountryCard_Previews: PreviewProvider {
    
    static let name = Name(common: "Jordan", official: "Hashemite Kingdom of Jordan", nativeName: ["ara": NativeName(official: "المملكة الأردنية الهاشمية", common: "الأردن")])
    static let tld = [".jo", "الاردن."]
    static let cca2 = "JO"
    static let ccn3 = "400"
    static let cca3 = "JOR"
    static let cioc = "JOR"
    static let independent = true
    static let status = "officially-assigned"
    static let unMember = true
    static let currencies = ["JOD": Currency(name: "Jordanian dinar", symbol: "د.ا")]
    static let idd = Idd(root: "+9", suffixes: ["62"])
    static let capital = ["Amman"]
    static let altSpellings = ["JO", "Hashemite Kingdom of Jordan", "al-Mamlakah al-Urdunīyah al-Hāshimīyah"]
    static let region = "Asia"
    static let subregion = "Western Asia"
    static let languages = ["ara": "Arabic"]
    static let translations = Translations(ara: NativeName(official: "المملكة الأردنية الهاشمية", common: "الأردن"), bre: NativeName(official: "Rouantelezh hachemit Jordania", common: "Jordania"), ces: NativeName(official: "Jordánské hášimovské království", common: "Jordánsko"))
    static let latlng = [31.0, 36.0]
    static let landlocked = false
    static let borders = ["IRQ", "ISR", "PSE", "SAU", "SYR"]
    static let area = 89342.0
    static let demonyms = ["eng": Demonym(f: "Jordanian", m: "Jordanian"), "fra": Demonym(f: "Jordanienne", m: "Jordanien")]
    static let flag = "🇯🇴"
    static let maps = Maps(googleMaps: "https://goo.gl/maps/ko1dzSDKg8Gsi9A98", openStreetMaps: "https://www.openstreetmap.org/relation/184818")
    static let population = 10203140
    static let gini: [String: Double]? = ["2010": 33.7]
    static let fifa = "JOR"
    static let car = Car(signs: ["HKJ"], side: "right")
    static let timezones = ["UTC+03:00"]
    static let continents = ["Asia"]
    static let flags = Flags(png: "https://flagcdn.com/w320/jo.png", svg: "https://flagcdn.com/jo.svg", alt: "The flag of Jordan is composed of three equal horizontal bands of black, white and green, with a red isosceles triangle superimposed on the hoist side of the field. This triangle has its base on the hoist end, spans about half the width of the field and bears a small seven-pointed white star at its center.")
    static let coatOfArms = CoatOfArms(png: "https://mainfacts.com/media/images/coats_of_arms/jo.png", svg: "https://mainfacts.com/media/images/coats_of_arms/jo.svg")
    static let startOfWeek = "sunday"
    static let capitalInfo = CapitalInfo(latlng: [31.95, 35.93])
    static let postalCode = PostalCode(format: "#####", regex: "^(\\d{5})$")

    static let country = Country(name: name, tld: tld, cca2: cca2, ccn3: ccn3, cca3: cca3, cioc: cioc, independent: independent, status: status, unMember: unMember, currencies: currencies, idd: idd, capital: capital, altSpellings: altSpellings, region: region, subregion: subregion, languages: languages, translations: translations, latlng: latlng, landlocked: landlocked, borders: borders, area: area, demonyms: demonyms, flag: flag, maps: maps, population: population, gini: gini, fifa: fifa, car: car, timezones: timezones, continents: continents, flags: flags, coatOfArms: coatOfArms, startOfWeek: startOfWeek, capitalInfo: capitalInfo, postalCode: postalCode)

    static var previews: some View {
        CountryCard(country: country)
    }
}


