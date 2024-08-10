//
//  User.swift
//  TestUIKit
//
//  Created by Fauzan Firzandy on 11/08/24.
//

import Foundation

struct UserResponse: Codable {
    let data: [User]
}

struct User: Codable {
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
    let avatar: String
}
