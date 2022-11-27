//
//  EndpointKinds.swift
//  TestTask
//
//  Created by Roman Romanyshyn on 27.11.2022.
//

import Foundation

enum EndpointKinds {
    enum Users: EndpointKind {
        static func prepare(_ request: inout URLRequest, with _: Void) {
        }
        
        static var host: String = "randomuser.me"

    }
    
    enum Sports: EndpointKind {
        static func prepare(_ request: inout URLRequest, with _: Void) {
        }
        
        static var host: String = "sports.api.decathlon.com"
    }
}

extension Endpoint where Kind == EndpointKinds.Users {
    static func randomUsers(_ amount: Int) -> Self {
        Endpoint(path: "api/",
                 queryItems: [URLQueryItem(name: "results", value: String(amount)),
                              URLQueryItem(name: "inc", value: "name, phone")
                             ],
                 httpMethod: .get)
    }
}

extension Endpoint where Kind == EndpointKinds.Sports {
    static func sports() -> Self {
        Endpoint(path: "sports/",
                 queryItems: [URLQueryItem(name: "parents_only", value: "true"),
                              URLQueryItem(name: "has_icon", value: "false")
                             ],
                 httpMethod: .get)
    }
}

extension Endpoint {
    func makeRequest(with data: Kind.RequestData) -> URLRequest? {
                
        var components = URLComponents()
        components.scheme = "https"
        components.host = Kind.host
        components.path = "/" + path
        components.queryItems = queryItems.isEmpty ? nil : queryItems
        
        guard let url = components.url else { return nil }

        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        Kind.prepare(&request, with: data)
        return request
    }
}
