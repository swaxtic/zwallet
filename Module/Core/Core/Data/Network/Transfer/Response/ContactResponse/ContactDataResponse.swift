//
//  ContactDataResponse.swift
//  Core
//
//  Created by MacBook on 27/05/21.
//

import Foundation

public struct ContactDataResponse: Codable {
    public var id: Int
    public var name: String
    public var phone: String
    public var image: String
}
