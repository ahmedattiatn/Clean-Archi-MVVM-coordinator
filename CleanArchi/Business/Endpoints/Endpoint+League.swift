//
//  Endpoint+League.swift
//
//  Created by Ahmed Atia on 04/05/2023.
//

import Foundation

extension Endpoint {
    static var leagues: Self {
        return Endpoint(path: "/all_leagues.php")
    }
}
