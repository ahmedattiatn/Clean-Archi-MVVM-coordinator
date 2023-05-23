//
//  NetworkerProtocol.swift
//
//  Created by Ahmed Atia on 04/05/2023.
//

import Combine
import Foundation

// MARK: - NetworkerProtocol

protocol NetworkerProtocol: AnyObject {
    typealias Headers = [String: Any]

    func get<T>(type: T.Type,
                url: URL,
                headers: Headers) -> AnyPublisher<T, NetworkAPIError> where T: Decodable

    func getData(url: URL, headers: Headers) -> AnyPublisher<Data, URLError>
}
