//
//  SignUpInteractor.swift
//  SignUp
//
//  Created by MacBook on 26/05/21.
//

import Foundation

protocol SignUpInteractor {
    func postSignUpData(username: String, email: String, password: String)
    func postActivateToken(email: String, otp: String)
}
