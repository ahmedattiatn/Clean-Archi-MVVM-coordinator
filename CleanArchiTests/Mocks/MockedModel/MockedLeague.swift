//
//  MockedLeague.swift
//
//  Created by Ahmed Atia on 05/05/2023.
//

import Foundation

extension League {
    static func fakeOne() -> Self {
        return League(idLeague: "Test1",
                      strLeague: "strLeague",
                      strSport: "strSport",
                      strLeagueAlternate: "strLeagueAlternate")
    }

    static func fakeTwo() -> Self {
        return League(idLeague: "Test2",
                      strLeague: "strLeague2",
                      strSport: "",
                      strLeagueAlternate: "")
    }

    static func fakeNil() -> Self {
        return League(idLeague: "Test3",
                      strLeague: "NoValue",
                      strSport: nil,
                      strLeagueAlternate: nil)
    }
}

extension Leagues {
    static func fake() -> Self {
        return Leagues(data: [League.fakeOne(), League.fakeTwo(), League.fakeNil()])
    }
}

// MARK: - Leagues + Equatable

extension Leagues: Equatable {
    static func == (lhs: Leagues, rhs: Leagues) -> Bool {
        return lhs.data == rhs.data
    }
}

// MARK: - League + Equatable

extension League: Equatable {
    static func == (lhs: League, rhs: League) -> Bool {
        return lhs.idLeague == rhs.idLeague && lhs.strLeague == rhs.strLeague
    }
}
