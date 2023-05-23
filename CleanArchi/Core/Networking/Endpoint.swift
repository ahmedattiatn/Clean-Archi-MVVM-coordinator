//
//  Endpoint.swift
//
//  Created by Ahmed Atia on 04/05/2023.
//

//

import Foundation

// MARK: - Endpoint

/// Reusable base Endpoint struct
struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}
