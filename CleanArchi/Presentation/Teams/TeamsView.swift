//
//  TeamsView.swift
//
//  Created by Ahmed Atia on 04/05/2023.
//

import Lottie
import SwiftUI

// MARK: - TeamsView

struct TeamsView: View {
    @State private var searchText = ""
    @ObservedObject var viewModel: TeamsViewModel

    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationStack {
            ScrollView {
                if viewModel.showLoader {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
                if viewModel.teams.data.isEmpty || viewModel.leagues.data.isEmpty {
                    if viewModel.networkError {
                        LottieView(name: "networkProblem", loopMode: .loop, play: .constant(true)).scaledToFit()
                    }
                    else {
                        LottieView(name: "animationView", loopMode: .loop, play: .constant(true)).scaledToFit()
                    }
                }
                LazyVGrid(columns: columns, spacing: Dimension.padding20) {
                    ForEach(viewModel.teams.data, id: \.strTeam) { team in
                        NavigationLink {
                            TeamsRouter.destinationForTappedTeam(team: team)
                        } label: {
                            HStack(alignment: .center, spacing: Dimension.padding12) {
                                AsyncImageView(stringURL: team.strTeamBadge, title: team.strTeam)
                            }
                        }
                    }
                }
            }

            .navigationTitle("Equipes_title".localized)
            .onAppear { viewModel.onAppear() }
            .searchable(text: $searchText, prompt: "Search_promopt".localized) {
                if !searchText.isEmpty, !viewModel.getFilteredLeagueNames(for: searchText).isEmpty {
                    ForEach(Array(viewModel.getFilteredLeagueNames(for: searchText).enumerated()), id: \.offset) { _, league in
                        Text(league)
                            .searchCompletion(league)
                    }
                }
            }
        }
        .onSubmit(of: .search, runSearch)
    }

    func runSearch() {
        hideKeyboard()
        if viewModel.isValid(searchText) {
            viewModel.getTeams(for: searchText)
        }
    }
}

// MARK: - TeamsView_Previews

struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView(viewModel: TeamsViewModel())
    }
}
