//
//  TeamServiceProtocol.swift
//
//  Created by Ahmed Atia on 04/05/2023.
//

import Combine
protocol TeamServiceProtocol: AnyObject {
    var networker: NetworkerProtocol { get }
    func getTeams(for league: String) -> AnyPublisher<Teams, NetworkAPIError>
    func sort(teams: Teams) -> [Team]
}
