//
//  CreatePinPresenterImpl.swift
//  CreatePin
//
//  Created by MacBook on 26/05/21.
//

import Foundation


class CreatePinPresenterImpl: CreatePinPresenter {
    
    let view: CreatePinView
    let interactor: CreatePinInteractor
    let router: CreatePinRouter
    
    init(view: CreatePinView, interactor: CreatePinInteractor, router: CreatePinRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func createPin(pin: String) {
        self.interactor.postPinData(pin: pin)
    }
    
    func navigateToLogin() {
        self.router.navigateToLogin()
    }
}

extension CreatePinPresenterImpl: CreatePinInteractorOutput {
    func createPinResult(isSuccess: Bool, status: Int, message: String) {
        if isSuccess {
            self.view.showMessage(message: message)
            self.view.showSuccess()
        } else {
            self.view.showMessage(message: message)
        }
    }
}
