//
//  TransferEntity.swift
//  Core
//
//  Created by MacBook on 29/05/21.
//

import Foundation

public struct TransferEntity: Encodable, Decodable {
    public var receiver: Int
    public var amount: Int
    public var notes: String
    
    public init (receiver: Int, amount: Int, notes: String){
        self.receiver = receiver
        self.amount = amount
        self.notes = notes
    }
}
