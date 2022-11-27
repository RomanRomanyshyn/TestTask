//
//  SportModel.swift
//  TestTask
//
//  Created by Roman Romanyshyn on 27.11.2022.
//

import Foundation

// MARK: - SportResponse
struct SportResponse: Codable {
    let data: [SportData]
}

// MARK: - SportData
struct SportData: Codable {
    let id: Int
    let attributes: SportAttributes
}

// MARK: - SportAttributes
struct SportAttributes: Codable {
    let name: String
    let attributesDescription: String?

    enum CodingKeys: String, CodingKey {
        case name
        case attributesDescription = "description"
    }
}

extension SportData: Model {
    var title: String {
        attributes.name
    }
    
    var subtitle: String {
        attributes.attributesDescription ?? String()
    }
}
