//
//  SportsLoader.swift
//  TestTask
//
//  Created by Roman Romanyshyn on 27.11.2022.
//

import Foundation

protocol AnySportsLoader {
    func loadSports() async throws -> SportResponse
}

final class SportsLoader {
    let urlSession: URLSession
    
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
}

extension SportsLoader: AnySportsLoader {
    func loadSports() async throws -> SportResponse {
        try await urlSession.data(for: .sports(), using: Void())
    }
}
