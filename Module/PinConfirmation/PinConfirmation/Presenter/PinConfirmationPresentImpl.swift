//
//  PinConfirmationPresentImpl.swift
//  PinConfirmation
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import UIKit
import Core

class PinConfirmationPresenterImpl: PinConfirmationPresenter {
        
    let view: PinConfirmationView
    let interactor: PinConfirmationInteractor
    let router: PinConfirmationRouter
    
    init(view: PinConfirmationView, interactor: PinConfirmationInteractor, router: PinConfirmationRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func createTransaction(pin: String) {
        self.interactor.postTransactionData(pin: pin)
    }
    func navigateToTransactionResult(viewController: UIViewController, isSuccess: Bool) {
        self.router.navigateToTransactionResult(viewController: viewController, isSuccess: isSuccess)
    }
    
    func navigateBackToHome(viewController: UIViewController) {
        self.router.navigateBackToHome(viewController: viewController)
    }
}

extension PinConfirmationPresenterImpl: PinConfirmationInteractorOutput {
    func createTransactionResult(isSuccess: Bool, status: Int) {
        if isSuccess {
            if status == 404 {
                self.view.showAlert(message: "Pin Salah")
            } else if status == 200 {
                self.view.showTransactionResult(isSuccess: isSuccess, status: status)
            }
        } else {
            self.view.showTransactionResult(isSuccess: isSuccess, status: status)
        }
    }
    
//    func createPinResult(isSuccess: Bool, status: Int, message: String) {
//        if isSuccess {
//            self.view.showMessage(message: message)
//            self.view.showSuccess()
//        } else {
//            self.view.showMessage(message: message)
//        }
//    }
}
