//
//  SignUpPresenter.swift
//  SignUp
//
//  Created by MacBook on 26/05/21.
//

import Foundation

protocol SignUpPresenter {
    func signup(username: String,email: String, password: String)
    func activateAccount(email: String, otp: String)
    func navigateToLogin()
}
