//
//  RandomUsersLoader.swift
//  TestTask
//
//  Created by Roman Romanyshyn on 27.11.2022.
//

import Foundation

protocol AnyRandomUsersLoader {
    func loadUsers() async throws -> RandomUserResponse
}

final class RandomUsersLoader {
    let urlSession: URLSession
    
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
}

extension RandomUsersLoader: AnyRandomUsersLoader {
    func loadUsers() async throws -> RandomUserResponse {
        try await urlSession.data(for: .randomUsers(20), using: Void())
    }
}
