//
//  PinConfirmationInteractor.swift
//  PinConfirmation
//
//  Created by MacBook on 29/05/21.
//

import Foundation

public protocol PinConfirmationInteractor {
    func postTransactionData(pin: String)
}
