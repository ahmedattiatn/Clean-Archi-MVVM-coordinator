//
//  TeamsViewModelTests.swift
//
//  Created by Ahmed Atia on 05/05/2023.
//

import Combine
import Foundation
import XCTest

class TeamsViewModelTests: XCTestCase {
    // custom urlsession for mock network calls

    var urlSession: URLSession!
    private var cancellables = Set<AnyCancellable>()
    private var mockedVM: TeamsViewModel!
    private var mockedLeagueService: MockedLeagueService!
    private var mockedTeamService: MockedTeamService!
    private let mockedTeams = Teams.fake()
    private let mockedLeagues = Leagues.fake()

    override func setUpWithError() throws {
        // Set url session for mock networking
        mockedTeamService = MockedTeamService(loadModelsResult: .success(mockedTeams))
        mockedLeagueService = MockedLeagueService(loadModelsResult: .success(mockedLeagues))
        mockedVM = TeamsViewModel(leagueService: mockedLeagueService, teamService: mockedTeamService)
    }

    override func tearDownWithError() throws {
        mockedTeamService = nil
        mockedLeagueService = nil
        mockedVM = nil
    }

    func testGetLeagues() throws {
        let expectation = expectation(description: "expect Leagues to get loaded")
        mockedVM
            .$leagues
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { actualModels in
                    if actualModels == self.mockedLeagues {
                        expectation.fulfill()
                    }
                }
            )
            .store(in: &cancellables)
        mockedVM.onAppear()
        waitForExpectations(timeout: 10)
    }

    func test_GetTeams() throws {
        let expectation = expectation(description: "expect Teams to get loaded")
        mockedVM
            .$teams
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { actualModels in
                    if actualModels == self.mockedTeams {
                        expectation.fulfill()
                    }
                }
            )
            .store(in: &cancellables)
        mockedVM.getTeams(for: "English League Championship")
        waitForExpectations(timeout: 10)
    }

    func test_GetFilteredLeagueNames_isSuccess() {
        let searchScopes = mockedLeagues.data.map { $0.strLeague }
        let filtred = searchScopes.filter { $0.localizedCaseInsensitiveContains("strLeague") }
        let expected = ["strLeague", "strLeague2"]
        XCTAssertEqual(expected, filtred)
    }

    func test_GetFilteredLeagueNames_OnlyOneValue() {
        let searchScopes = mockedLeagues.data.map { $0.strLeague }
        let filtred = searchScopes.filter { $0.localizedCaseInsensitiveContains("NoValue") }
        let expected = filtred == ["NoValue"]
        XCTAssertTrue(expected)
    }

    func test_GetFilteredLeagueNames_Empty() {
        let searchScopes = mockedLeagues.data.map { $0.strLeague }
        let filtred = searchScopes.filter { $0.localizedCaseInsensitiveContains("Ligua") }
        let expected = filtred != ["League"]
        XCTAssertTrue(expected)
    }
}
