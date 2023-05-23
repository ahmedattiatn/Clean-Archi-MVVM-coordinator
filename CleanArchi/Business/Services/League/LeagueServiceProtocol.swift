//
//  LeagueServiceProtocol.swift
//
//  Created by Ahmed Atia on 04/05/2023.
//

import Combine

protocol LeagueServiceProtocol: AnyObject {
    var networker: NetworkerProtocol { get }
    func getLeagues() -> AnyPublisher<Leagues, NetworkAPIError>
}
