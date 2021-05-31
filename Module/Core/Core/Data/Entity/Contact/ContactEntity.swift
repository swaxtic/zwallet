//
//  ContactEntity.swift
//  Core
//
//  Created by MacBook on 27/05/21.
//

import Foundation

public struct ContactEntity: Encodable, Decodable {
    public var id: Int
    public var name: String
    public var phone: String
    public var imageUrl: String
    
    public init (id: Int, name: String, phone: String, imageUrl: String){
        self.id = id
        self.name = name
        self.phone = phone
        self.imageUrl = imageUrl
    }
}
