//
//  LeagueService.swift
//
//  Created by Ahmed Atia on 04/05/2023.
//

import Combine

// MARK: - LeagueService

final class LeagueService: LeagueServiceProtocol {
    let networker: NetworkerProtocol

    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }

    func getLeagues() -> AnyPublisher<Leagues, NetworkAPIError> {
        let endpoint = Endpoint.leagues
        return networker.get(type: Leagues.self,
                             url: endpoint.url,
                             headers: endpoint.headers)
    }
}
