//
//  TransactionStatusPresenterImpl.swift
//  TransactionStatus
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import UIKit
import Core

class TransactionStatusPresenterImpl: TransactionStatusPresenter {
    
    let view: TransactionStatusView
    let router: TransactionStatusRouter
    
    init(view: TransactionStatusView, router: TransactionStatusRouter) {
        self.view = view
        self.router = router
    }
    
    public func loadDataTransfer(isSuccess: Bool) {
        let dataReceiver = UserDefaultHelper.shared.getDataContact()
        let dataTransfer = UserDefaultHelper.shared.getDataTransfer()
        let userbalance: Int? = UserDefaultHelper.shared.get(key: .userBalance.self)
        self.view.showTransferData(receiverData: dataReceiver ?? ContactEntity(id: 0, name: "", phone: "", imageUrl: ""), transferData: dataTransfer ?? TransferEntity(receiver: 0, amount: 0, notes: ""), isSuccess: isSuccess, userBalance: userbalance ?? 0)
    }
    
    func navigateBack(viewController: UIViewController, isSuccess: Bool) {
        if isSuccess {
            self.router.navigateBackToHome(viewController: viewController)
        } else {
            self.router.navigateBack(viewController: viewController)
        }
    }
}
