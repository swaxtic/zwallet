//
//  SignUpPresenterImpl.swift
//  SignUp
//
//  Created by MacBook on 26/05/21.
//

import Foundation

class SignUpPresenterImpl: SignUpPresenter {
    
    let view: SignUpView
    let interactor: SignUpInteractor
    let router: SignUpRouter
    
    init(view: SignUpView, interactor: SignUpInteractor, router: SignUpRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func signup(username: String, email: String, password: String) {
        self.interactor.postSignUpData(username: username, email: email, password: password)
    }
    
    func activateAccount(email: String, otp: String) {
        self.interactor.postActivateToken(email: email, otp: otp)
    }
    
    func navigateToLogin() {
        self.router.navigateToLogin()
    }
}

extension SignUpPresenterImpl: SignUpInteractorOutput {
    func activateResult(isSuccess: Bool, message: String) {
        if isSuccess {
            self.router.navigateToLogin()
            self.view.showToast(message: message)
        } else {
            self.view.showMessage(message: message)
        }
    }
    
    func signUpResult(isSuccess: Bool, message: String) {
        if isSuccess {
            self.view.showMessage(message: message)
            self.view.showActivateField()
        } else {
            self.view.showMessage(message: message)
        }
    }
}
