//
//  TeamsConfigurator.swift
//
//  Created by Ahmed Atia on 04/05/2023.
//

import Foundation
import SwiftUI

final class TeamsConfigurator {
    public static func configureTeamsView(
        with viewModel: TeamsViewModel = TeamsViewModel()
    ) -> TeamsView {
        let view = TeamsView(viewModel: viewModel)
        return view
    }
}
