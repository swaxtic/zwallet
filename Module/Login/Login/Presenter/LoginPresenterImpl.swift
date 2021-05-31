//
//  LoginPresenterImpl.swift
//  Login
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import Core

class LoginPresenterImpl: LoginPresenter {
    
    let view: LoginView
    let interactor: LoginInteractor
    let router: LoginRouter
    
    init(view: LoginView, interactor: LoginInteractor, router: LoginRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func login(email: String, password: String) {
        self.interactor.postLoginData(email: email, password: password)
    }
    
    func navigateToSignUp() {
        self.router.navigateToSignUp()
    }
    
}

extension LoginPresenterImpl: LoginInteractorOutput {
    
    func authenticationResult(isSuccess: Bool, status: Int, message: String, hasPin: Bool) {
        if isSuccess {
            if hasPin {
                self.router.navigateToHome()
                self.view.showToast(message: message)
            } else {
                self.router.navigateToCreatePin()
                self.view.showToast(message: message)
            }
        } else {
            self.view.showError(message: message)
        }
    }
}
