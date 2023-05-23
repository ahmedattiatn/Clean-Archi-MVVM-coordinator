//
//  MockedLeagueService.swift
//
//  Created by Ahmed Atia on 05/05/2023.
//

import Combine
import Foundation

// MARK: - MockedLeagueService

final class MockedLeagueService: LeagueServiceProtocol {
    let networker: NetworkerProtocol
    let loadModelsResult: Result<Leagues, NetworkAPIError>

    init(networker: NetworkerProtocol = Networker(), loadModelsResult: Result<Leagues, NetworkAPIError>) {
        self.networker = networker
        self.loadModelsResult = loadModelsResult
    }

    func getLeagues() -> AnyPublisher<Leagues, NetworkAPIError> {
        return loadModelsResult.publisher.eraseToAnyPublisher()
    }
}
