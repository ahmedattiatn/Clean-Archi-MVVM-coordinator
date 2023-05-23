//
//  TeamsRouter.swift
//
//  Created by Ahmed Atia on 04/05/2023.
//

import SwiftUI

// MARK: - UsersRouter

final class TeamsRouter {
    public static func destinationForTappedTeam(team: Team) -> some View {
        return TeamDetailConfigurator.configureTeamDetailView(with: team)
    }
}
