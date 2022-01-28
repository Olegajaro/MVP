//
//  Comment.swift
//  MVP
//
//  Created by Олег Федоров on 27.01.2022.
//

import Foundation

struct Comment: Codable {
    let postID, id: Int
    let name, email, body: String

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}
