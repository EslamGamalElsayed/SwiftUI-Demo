//
//  CustomError.swift
//  Shipper
//
//  Created by Eslam Gamal on 03/11/2024.
//

import Foundation

struct CustomError: Codable {
    let code: Int?
    let message: String?
    let uuid: String?

    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case message = "msg"
        case uuid = "uuid"
    }
    init(codeStatus: Int, message: String = "", uuid: String = "") {
        self.code = codeStatus
        self.message = message
        self.uuid = uuid
    }
}
