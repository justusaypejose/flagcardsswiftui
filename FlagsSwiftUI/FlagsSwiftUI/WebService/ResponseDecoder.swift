//
//  ResponseDecoder.swift
//  FlagsSwiftUI
//
//  Created by Justus Aype Jose on 05/07/23.
//

import Foundation

class ResponseDecoder: JSONDecoder {
    
    override init() {
        super.init()
        self.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    override func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable {
        do {
            return try super.decode(type, from: data)
        } catch {
            throw ServiceError.DecodeFailure
        }
    }
}

