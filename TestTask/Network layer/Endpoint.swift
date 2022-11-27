//
//  Endpoint.swift
//  TestTask
//
//  Created by Roman Romanyshyn on 27.11.2022.
//

import Foundation

struct Endpoint<Kind: EndpointKind, Response: Decodable> {
    var path: String
    var queryItems = [URLQueryItem]()
    var httpMethod: HttpMethod
    
    var host = Kind.host
}

extension Endpoint {
    init(path: String, queryItems: URLQueryItem..., httpMethod: HttpMethod = .get) {
        self.path = path
        self.queryItems = queryItems
        self.httpMethod = httpMethod
    }
}

protocol EndpointKind {
    associatedtype RequestData
    
    static func prepare(_ request: inout URLRequest,
                        with data: RequestData)
    static var host: String { get }
}
