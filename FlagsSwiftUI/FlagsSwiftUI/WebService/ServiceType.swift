//
//  ServiceType.swift
//  FlagsSwiftUI
//
//  Created by Justus Aype Jose on 07/07/23.
//

import Foundation

enum ServiceType {
    case countries
    
    func url() -> URL? {
        var path: String = ""
        switch self {
        case .countries:
            path = ServiceConstants.countriesURL
        }
        return URL(string: ServiceConstants.baseURL + path)
    }
}
