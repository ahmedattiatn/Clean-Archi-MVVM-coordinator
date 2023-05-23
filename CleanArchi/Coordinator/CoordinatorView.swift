//
//  CoordinatorView.swift
//  CleanArchi
//
//  Created by Ahmed Atia on 23/05/2023.
//

import SwiftUI

// MARK: - CoordinatorView

struct CoordinatorView: View {
    @StateObject private var coordinator: Coordinator = .init()

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .teams)
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.build(sheet: sheet)
                }
        }
        .environmentObject(coordinator)
    }
}

// MARK: - CoordinatorView_Previews

struct CoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorView()
    }
}
