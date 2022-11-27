//
//  URLSession+Extension.swift
//  TestTask
//
//  Created by Roman Romanyshyn on 27.11.2022.
//

import Foundation

enum InvalidEndpointError: Error {
    case error
}

extension URLSession {
    func data<K, R>(for endpoint: Endpoint<K, R>,
                    using requestData: K.RequestData,
                    decoder: JSONDecoder = .init()
    ) async throws -> R {
        guard let request = endpoint.makeRequest(with: requestData) else {
            throw InvalidEndpointError.error
        }
        let (data, _) = try await data(for: request)
        return try decoder.decode(R.self, from: data)
    }
}

