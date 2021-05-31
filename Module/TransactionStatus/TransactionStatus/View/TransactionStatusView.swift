//
//  TransactionStatusView.swift
//  TransactionStatus
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import Core

public protocol TransactionStatusView {
    func showTransferData(receiverData: ContactEntity, transferData: TransferEntity, isSuccess: Bool, userBalance: Int)
}
