//
//  ConfirmationTransactionPresenterImpl.swift
//  ConfirmationTransaction
//
//  Created by MacBook on 29/05/21.
//

import Foundation

import Foundation
import UIKit
import Core

public class ConfirmationTransactionPresenterImpl: ConfirmationTransactionPresenter {

    let view: ConfirmationTransactionView
    let router: ConfirmationTransactionRouter
    
    init(view: ConfirmationTransactionView, router: ConfirmationTransactionRouter) {
        self.view = view
        self.router = router
    }
    
    public func loadDataTransfer() {
        let dataReceiver = UserDefaultHelper.shared.getDataContact()
        let dataTransfer = UserDefaultHelper.shared.getDataTransfer()
        let userbalance: Int? = UserDefaultHelper.shared.get(key: .userBalance.self)
        self.view.showTransferData(receiverData: dataReceiver ?? ContactEntity(id: 0, name: "", phone: "", imageUrl: ""), transferData: dataTransfer ?? TransferEntity(receiver: 0, amount: 0, notes: ""), userBalance: userbalance ?? 0)
    }
    
    public func navigateToInputPin(viewController: UIViewController) {
        self.router.navigateToInputPin(viewController: viewController)
    }
    
    public func backToSetAmount(viewController: UIViewController) {
        self.router.navigateToSetAmount(viewController: viewController)
    }
}
