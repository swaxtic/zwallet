//
//  HistoryPresenterImpl.swift
//  History
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import UIKit
import Core

class HistoryPresenterImpl: HistoryPresenter {
  
    let view: HistoryView
    let interactor: HistoryInteractor
    let router: HistoryRouter
    
    init(view: HistoryView, interactor: HistoryInteractor, router: HistoryRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func loadThisWeekTransaction() {
        self.interactor.getThisWeekTransaction()
    }
    
    func loadAllTransaction() {
        self.interactor.getAllTransaction()
    }
    
    func goBackToHome(viewController: UIViewController) {
        self.router.navigateToHome(viewController: viewController)
    }
    
    
}

extension HistoryPresenterImpl: HistoryInteractorOutput {
    func loadedThisWeekTransaction(transactions: [TransactionEntity]) {
        self.view.showTransactionData(transactions: transactions)
    }
    
    func loadedAllTransaction(transactions: [TransactionEntity]) {
        self.view.showTransactionData(transactions: transactions)
    }
}
