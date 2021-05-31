//
//  ConfirmationTransactionView.swift
//  ConfirmationTransaction
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import Core

public protocol ConfirmationTransactionView {
    func showTransferData(receiverData: ContactEntity, transferData: TransferEntity, userBalance: Int)
}
