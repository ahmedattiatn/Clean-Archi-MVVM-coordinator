//
//  TeamDetailViewModel.swift
//
//  Created by Ahmed Atia on 12/05/2023.
//

import Combine
import UIKit

class TeamDetailViewModel: ObservableObject {
    public let team: Team

    init(team: Team) {
        self.team = team
    }
}
