//
//  ServiceError.swift
//  FlagsSwiftUI
//
//  Created by Justus Aype Jose on 07/07/23.
//

import Foundation

enum ServiceError: Error {
    case ResponseInvalidCode
    case DecodeFailure
}
