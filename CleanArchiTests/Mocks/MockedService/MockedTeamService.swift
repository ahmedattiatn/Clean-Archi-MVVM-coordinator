//
//  MockedTeamService.swift
//
//  Created by Ahmed Atia on 05/05/2023.
//

import Combine
import Foundation

// MARK: - MockedTeamService

final class MockedTeamService: TeamServiceProtocol {
    let networker: NetworkerProtocol
    let loadModelsResult: Result<Teams, NetworkAPIError>

    init(networker: NetworkerProtocol = Networker(), loadModelsResult: Result<Teams, NetworkAPIError>) {
        self.networker = networker
        self.loadModelsResult = loadModelsResult
    }

    func getTeams(for league: String) -> AnyPublisher<Teams, NetworkAPIError> {
        return loadModelsResult.publisher.eraseToAnyPublisher()
    }

    func sort(teams: Teams) -> [Team] {
        return teams.data.sorted(by: { $0.strTeam ?? "" < $1.strTeam ?? "" })
    }
}
