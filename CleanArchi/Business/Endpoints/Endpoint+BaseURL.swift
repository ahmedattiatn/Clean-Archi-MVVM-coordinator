//
//  Endpoint+BaseURL.swift
//
//  Created by Ahmed Atia on 04/05/2023.
//

import Foundation

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "www.thesportsdb.com"
        components.path = "/api/v1/json" + apiKey + path
        components.queryItems = queryItems

        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }

        return url
    }

    var apiKey: String {
        return "/50130162"
    }

    var headers: [String: Any] {
        return [
            "applicationJson": "application/json",
            "contentType": "Content-Type"
        ]
    }
}
