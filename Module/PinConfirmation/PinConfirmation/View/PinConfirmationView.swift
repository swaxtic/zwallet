//
//  PinConfirmationView.swift
//  PinConfirmation
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import Core

protocol PinConfirmationView {
    func showTransactionResult(isSuccess: Bool, status: Int)
    func showAlert(message: String)
}
