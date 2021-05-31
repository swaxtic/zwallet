//
//  HistoryInteractorOutput.swift
//  History
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import Core

protocol HistoryInteractorOutput {
    func loadedThisWeekTransaction(transactions: [TransactionEntity])
    func loadedAllTransaction(transactions: [TransactionEntity])
}
