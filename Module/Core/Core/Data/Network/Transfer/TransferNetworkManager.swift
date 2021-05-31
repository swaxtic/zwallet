//
//  TransferNetworkManager.swift
//  Core
//
//  Created by MacBook on 27/05/21.
//

import Foundation

public protocol TransferNetworkManager {
    func getAllContact(completion: @escaping (ContactResponse?, Error?) -> ())
    func transfer(pin: String, receiver: Int, amount: Int, notes: String, completion: @escaping (TransferResponse?, Error?) -> ())
}
