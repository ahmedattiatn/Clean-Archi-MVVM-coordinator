//
//  Team.swift
//
//  Created by Ahmed Atia on 04/05/2023.
//

import Foundation

// MARK: - Teams

struct Teams: Codable {
    var data: [Team]
    enum CodingKeys: String, CodingKey {
        case data = "teams"
    }
}

// MARK: - Team

struct Team: Codable {
    let idTeam: String
    let strTeam: String?
    let strSport: String?
    let strLeague: String
    let idLeague: String
    let strTeamBadge: String
    let strTeamLogo: String?
    let strTeamBanner: String?
}

// MARK: Identifiable

extension Team: Identifiable {
    var id: String { idTeam }
}

// MARK: Equatable
