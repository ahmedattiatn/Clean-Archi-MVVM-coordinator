//
//  Networker.swift
//
//  Created by Ahmed Atia on 04/05/2023.
//

import Combine
import Foundation

// MARK: - Networker

final class Networker: NetworkerProtocol {
    func get<T>(type: T.Type,
                url: URL,
                headers: Headers) -> AnyPublisher<T, NetworkAPIError> where T: Decodable
    {
        var urlRequest = URLRequest(url: url)
        
        headers.forEach { key, value in
            if let value = value as? String {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .mapError { NetworkAPIError($0) }
            .retry(times: 1) { self.retryIfNeeded(error: $0) }
            .eraseToAnyPublisher()
    }
    
    func getData(url: URL, headers: Headers) -> AnyPublisher<Data, URLError> {
        var urlRequest = URLRequest(url: url)
        
        headers.forEach { key, value in
            if let value = value as? String {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .eraseToAnyPublisher()
    }
    
    private func retryIfNeeded(error: NetworkAPIError) -> Bool {
        switch error {
        case .responseError:
            return true
        default:
            return false
        }
    }
}
