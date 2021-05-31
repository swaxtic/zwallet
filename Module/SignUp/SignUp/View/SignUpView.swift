//
//  SignUpView.swift
//  SignUp
//
//  Created by MacBook on 26/05/21.
//

import Foundation

protocol SignUpView {
    func showMessage(message: String)
    func showToast(message: String)
    func showActivateField()
}
