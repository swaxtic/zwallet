//
//  SignUpInteractorOutput.swift
//  SignUp
//
//  Created by MacBook on 26/05/21.
//

import Foundation

protocol SignUpInteractorOutput {
    func signUpResult(isSuccess: Bool, message: String)
    func activateResult(isSuccess: Bool, message: String)
}
