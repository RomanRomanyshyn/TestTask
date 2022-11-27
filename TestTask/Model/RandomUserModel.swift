//
//  RandomUserModel.swift
//  TestTask
//
//  Created by Roman Romanyshyn on 27.11.2022.
//

import Foundation

// MARK: - RandomUserResponse
struct RandomUserResponse: Codable {
    let results: [User]
}

// MARK: - User
struct User: Codable {
    let name: UserName
    let phone: String
}

// MARK: - UserName
struct UserName: Codable {
    let title, first, last: String
}

extension User: Model {
    var title: String {
        "\(name.title) \(name.first) \(name.last)"
    }
    
    var subtitle: String {
        "phone: \(phone)"
    }
}
