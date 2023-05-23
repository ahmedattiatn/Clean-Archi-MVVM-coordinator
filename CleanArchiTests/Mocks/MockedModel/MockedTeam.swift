//
//  MockedTeam.swift
//
//  Created by Ahmed Atia on 05/05/2023.
//

import Foundation

extension Team {
    static func fakeOne() -> Self {
        return Team(idTeam: "idTeam1",
                    strTeam: "strTeam",
                    strSport: "strTeam",
                    strLeague: "strLeague",
                    idLeague: "idLeague",
                    strTeamBadge: "strTeamBadge",
                    strTeamLogo: "strTeamLogo",
                    strTeamBanner: "strTeamBanner")
    }

    static func fakeTwo() -> Self {
        return Team(idTeam: "idTeam1",
                    strTeam: "strTeam",
                    strSport: "strTeam",
                    strLeague: "strLeague",
                    idLeague: "",
                    strTeamBadge: "",
                    strTeamLogo: "",
                    strTeamBanner: "")
    }

    static func fakeNil() -> Self {
        return Team(idTeam: "idTeam1",
                    strTeam: nil,
                    strSport: "strTeam",
                    strLeague: "strLeague",
                    idLeague: "idLeague",
                    strTeamBadge: "strTeamBadge",
                    strTeamLogo: nil,
                    strTeamBanner: nil)
    }
}

extension Teams {
    static func fake() -> Self {
        return Teams(data: [Team.fakeOne(), Team.fakeTwo(), Team.fakeNil()])
    }
}

// MARK: - Teams + Equatable

extension Teams: Equatable {
    static func == (lhs: Teams, rhs: Teams) -> Bool {
        return lhs.data == rhs.data
    }
}

// MARK: - Team + Equatable

extension Team: Equatable {
    static func == (lhs: Team, rhs: Team) -> Bool {
        return lhs.idTeam == rhs.idTeam &&
            lhs.strTeamBadge == rhs.strTeamBadge &&
            lhs.strTeamBanner == rhs.strTeamBanner
    }
}
