//
//
//  Created by Ahmed Atia on 04/05/2023.
//

import SwiftUI

@main
struct CleanArchiApp: App {
    var body: some Scene {
        WindowGroup {
            TeamsConfigurator.configureTeamsView()
            // .preferredColorScheme(.light) // the app handle the dark mode but we can force the light mode also
        }
    }
}
