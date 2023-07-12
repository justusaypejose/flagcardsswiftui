//
//  APIService.swift
//  FlagsSwiftUI
//
//  Created by Justus Aype Jose on 05/07/23.
//

import Foundation

protocol Service {
    func urlRequest(type: ServiceType) -> URLRequest?
    func fetchData<T: Codable>(type: T.Type, serviceType: ServiceType, decoder: ResponseDecoder) async throws -> T?
}

extension Service {
    func urlRequest(type: ServiceType) -> URLRequest? {
        guard let url = type.url() else { return nil }
        return URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: TimeInterval(ServiceConstants.timeOutInterval))
    }

    func fetchData<T: Codable>(type: T.Type, serviceType: ServiceType, decoder: ResponseDecoder) async throws -> T? {
        guard let urlRequest = self.urlRequest(type: serviceType) else { return nil }
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { throw ServiceError.ResponseInvalidCode }

        return try decoder.decode(type.self, from: data)
    }
}

class RealService: Service {}

class MockService: Service {}

class APIService {
    
    private var service: Service
    private var decoder: ResponseDecoder

    init(service: Service = RealService(), decoder: ResponseDecoder = ResponseDecoder()) {
        self.service = service
        self.decoder = decoder
    }

    func fetch<T: Codable>(type: T.Type, serviceType: ServiceType) async throws -> T? {
        return try await service.fetchData(type: type, serviceType: serviceType, decoder: decoder)
    }
    
    
    func fetchCountries() {
            guard let url = URL(string: "https://restcountries.com/v3.1/all") else {
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, _, error in
                if let error = error {
                    print("Error: \(error)")
                    return
                }
                
                guard let data = data else {
                    print("No data received")
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let countriesData = try decoder.decode([Country].self, from: data)
                    
                    DispatchQueue.main.async {
                        print(countriesData)
                       // self.countries = countriesData
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            }.resume()
        }
}
