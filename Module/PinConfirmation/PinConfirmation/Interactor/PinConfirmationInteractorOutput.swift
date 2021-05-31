//
//  PinConfirmationInteractorOutput.swift
//  PinConfirmation
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import Core

protocol PinConfirmationInteractorOutput {
    func createTransactionResult(isSuccess: Bool, status: Int)
}
