//
//  InputAmountPresenterImpl.swift
//  InputAmount
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import UIKit
import Core

public class InputAmountPresenterImpl: InputAmountPresenter {
   
    let view: InputAmountView
    let router: InputAmountRouter
    
    init(view: InputAmountView, router: InputAmountRouter) {
        self.view = view
        self.router = router
    }
    
    public func backToReceiver(viewController: UIViewController) {
        self.router.navigateToReceiver(viewController: viewController)
    }
    
    public func loadDataReceiver() {
        let data = UserDefaultHelper.shared.getDataContact()
        let userbalance: Int? = UserDefaultHelper.shared.get(key: .userBalance.self)
        self.view.showReceiver(receiverData: data ?? ContactEntity(id: 0, name: "", phone: "", imageUrl: ""), userBalance: userbalance ?? 0)
    }
        
    public func navigateToConfirmation(viewController: UIViewController, dataTransfer: TransferEntity) {
        self.router.navigateToConfirmation(viewController: viewController, dataTransfer: dataTransfer)
    }
    
}
