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

    var id: String {
        return UUID().uuidString
    }

    public func hash(into hasher: inout Hasher) {
        return hasher.combine(self.id)
    }
}

// MARK: - Sheet

enum Sheet: Hashable, Identifiable {
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

    func push(_ page: Page) {
        self.path.append(page)
    }

    func present(_ sheet: Sheet) {
        self.sheet = sheet
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
}

extension Coordinator {
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .teams:
            TeamsConfigurator.configureTeamsView()
        }
    }

    @ViewBuilder
    func build(sheet: Sheet) -> some View {
        switch sheet {
        case .teamsDetail(let team):
            TeamDetailConfigurator.configureTeamDetailView(with: team)
        }
    }
}
