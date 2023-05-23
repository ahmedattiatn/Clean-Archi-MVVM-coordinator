//
//  TeamDetailConfigurator.swift
//
//  Created by Ahmed Atia on 12/05/2023.
//

import Foundation
final class TeamDetailConfigurator {
    public static func configureTeamDetailView(with team: Team) -> TeamDetailView {
        let view = TeamDetailView(viewModel: TeamDetailViewModel(team: team))
        return view
    }
}
