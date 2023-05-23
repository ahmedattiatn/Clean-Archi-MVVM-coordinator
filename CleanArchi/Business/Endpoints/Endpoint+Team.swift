//
//  Endpoint+Team.swift
//
//  Created by Ahmed Atia on 04/05/2023.
//

import Foundation

extension Endpoint {
    static func teams(for league: String) -> Self {
        return Endpoint(path: "/search_all_teams.php", queryItems: [
            URLQueryItem(name: "l", value: "\(league)")
        ])
    }
}
