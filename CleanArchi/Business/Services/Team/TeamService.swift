//
//  TeamService.swift
//
//  Created by Ahmed Atia on 04/05/2023.
//

import Combine

// MARK: - TeamService

final class TeamService: TeamServiceProtocol {
    let networker: NetworkerProtocol

    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }

    func getTeams(for league: String) -> AnyPublisher<Teams, NetworkAPIError> {
        let endpoint = Endpoint.teams(for: league)
        return networker.get(type: Teams.self,
                             url: endpoint.url,
                             headers: endpoint.headers)
    }

    func sort(teams: Teams) -> [Team] {
        return teams.data.sorted(by: { $0.strTeam ?? "" < $1.strTeam ?? "" })
    }
}
