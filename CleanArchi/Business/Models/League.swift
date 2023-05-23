//
//  League.swift
//
//  Created by Ahmed Atia on 04/05/2023.
//

// MARK: - Leagues

struct Leagues: Codable {
    let data: [League]

    enum CodingKeys: String, CodingKey {
        case data = "leagues"
    }
}

// MARK: - League

struct League: Codable {
    let idLeague, strLeague: String
    let strSport: String?
    let strLeagueAlternate: String?
}

// MARK: Identifiable

extension League: Identifiable {
    var id: String { idLeague }
}
