//
//  TransferDetailResponse.swift
//  Core
//
//  Created by MacBook on 29/05/21.
//

import Foundation

public struct TransferDetailResponse: Codable {
    public var sender: Int
    public var receiver: Int
    public var amount: Int
    public var notes: String
    public var type: Int
    public var createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case sender
        case receiver
        case amount
        case notes
        case type
        case createdAt = "created_at"
    }
}
