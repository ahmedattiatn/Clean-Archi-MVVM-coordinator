//
//  Coordinator.swift
//  CleanArchi
//
//  Created by Ahmed Atia on 23/05/2023.
//

import SwiftUI

// MARK: - Page

enum Page: Hashable, Identifiable {
    case teams
    case teamsDetail(Team)

    var id: String {
        return UUID().uuidString
    }

    public func hash(into hasher: inout Hasher) {
        return hasher.combine(self.id)
    }
}

// MARK: - FullScreenCover

enum FullScreenCover: Hashable, Identifiable {
    case teams
    case teamsDetail(Team)
    var id: String {
        return UUID().uuidString
    }

    public func hash(into hasher: inout Hasher) {
        return hasher.combine(self.id)
    }
}

// MARK: - Sheet

enum Sheet: Hashable, Identifiable {
    case teams
    case teamsDetail(Team)

    var id: String {
        return UUID().uuidString
    }

    public func hash(into hasher: inout Hasher) {
        return hasher.combine(self.id)
    }
}

// MARK: - Coordinator

class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?

    func push(_ page: Page) {
        self.path.append(page)
    }

    func present(_ sheet: Sheet) {
        self.sheet = sheet
    }

    func present(_ fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }

    func pop() {
        self.path.removeLast()
    }

    func popToRoot() {
        self.path.removeLast(self.path.count)
    }

    func dismissSheet() {
        self.sheet = nil
    }

    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
}

extension Coordinator {
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .teams:
            TeamsConfigurator.configureTeamsView()
        case .teamsDetail(let team):
            TeamDetailConfigurator.configureTeamDetailView(with: team)
        }
    }

    @ViewBuilder
    func build(sheet: Sheet) -> some View {
        switch sheet {
        case .teams:
            TeamsConfigurator.configureTeamsView()
        case .teamsDetail(let team):
            TeamDetailConfigurator.configureTeamDetailView(with: team)
        }
    }

    @ViewBuilder
    func build(fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .teams:
            TeamsConfigurator.configureTeamsView()
        case .teamsDetail(let team):
            TeamDetailConfigurator.configureTeamDetailView(with: team)
        }
    }
}
