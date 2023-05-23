//
//  TeamsViewModel.swift
//
//  Created by Ahmed Atia on 04/05/2023.
//

import Combine
import Foundation

// MARK: - TeamsViewModel

class TeamsViewModel: ObservableObject {
    @Published private(set) var teams: Teams = .init(data: [])
    @Published private(set) var leagues: Leagues = .init(data: [])
    @Published private(set) var networkError: Bool = false
    @Published private(set) var showLoader: Bool = false

    private var leagueService: LeagueServiceProtocol
    private var teamService: TeamServiceProtocol
    private var cancellables = Set<AnyCancellable>()

    private var searchScopes: [String] { leagues.data.map { $0.strLeague }}

    init(leagueService: LeagueServiceProtocol = LeagueService(),
         teamService: TeamServiceProtocol = TeamService())
    {
        self.leagueService = leagueService
        self.teamService = teamService
    }

    public func onAppear() {
        getLeagues()
    }

    private func getLeagues() {
        showLoader = true
        leagueService.getLeagues()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self else {
                    return
                }
                switch completion {
                case .failure:
                    self.networkError = true
                    self.showLoader = false
                case .finished: break
                }
            } receiveValue: { [weak self] leagues in
                guard let self else {
                    return
                }
                self.leagues = leagues
                self.networkError = false
                self.showLoader = false
            }
            .store(in: &cancellables)
    }

    func getTeams(for leagueName: String) {
        showLoader = true
        teams.data.removeAll()
        teamService.getTeams(for: leagueName)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self else {
                    return
                }
                switch completion {
                case .failure:
                    self.networkError = true
                    self.showLoader = false
                case .finished: break
                }
            } receiveValue: { [weak self] teams in
                guard let self else {
                    return
                }
                self.teams = teams
                self.teams.data = self.teamService.sort(teams: teams)
                self.networkError = false
                self.showLoader = false
            }
            .store(in: &cancellables)
    }

    func getFilteredLeagueNames(for searchText: String) -> [String] {
        return searchScopes.filter { $0.localizedCaseInsensitiveContains(searchText) }
    }

    func isValid(_ searchText: String) -> Bool {
        return searchScopes.filter { $0 == searchText }.isEmpty == false
    }

    deinit {
        cancellables.removeAll()
    }
}
