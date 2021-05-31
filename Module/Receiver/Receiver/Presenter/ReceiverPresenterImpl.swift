//
//  ReceiverPresenterImpl.swift
//  Receiver
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import Core
import UIKit
//import Transaction

public class ReceiverPresenterImpl: ReceiverPresenter {
    
    let view: ReceiverView
    let interactor: ReceiverInteractor
    let router: ReceiverRouter
    
    init(view: ReceiverView, interactor: ReceiverInteractor, router: ReceiverRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    public func loadDataReceiver() {
        self.interactor.getReceiverData()
    }
    
    public func backToHome(viewController: UIViewController) {
        self.router.navigateToHome(viewController: viewController)
    }
    
    public func navigateToSetAmount(viewController: UIViewController, receiverData: ContactEntity) {
        self.router.navigateToSetAmount(viewController: viewController, dataReceiver: receiverData)
    }
}

extension ReceiverPresenterImpl: ReceiverInteractorOutput {
    public func loadedDataReceiver(contacts: [ContactEntity]) {
        self.view.showAllReceiver(receiverData: contacts)
    }
}
