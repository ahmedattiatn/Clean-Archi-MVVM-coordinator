//
//  TeamDetailView.swift
//
//  Created by Ahmed Atia on 12/05/2023.
//

import SwiftUI

// MARK: - TeamDetailView

struct TeamDetailView: View {
    @ObservedObject var viewModel: TeamDetailViewModel

    var body: some View {
        VStack(alignment: .center, spacing: Dimension.padding16) {
            AsyncImageView(stringURL: viewModel.team.strTeamBadge)
                .padding()
            Text(viewModel.team.strSport ?? "")
            Text(viewModel.team.strLeague)
            Spacer()
        }
        .navigationTitle(viewModel.team.strTeam ?? "")
    }
}

// MARK: - TeamDetailView_Previews

struct TeamDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TeamDetailView(
            viewModel: TeamDetailViewModel(
                team: Team.fakeOne()
            )
        )
    }
}
