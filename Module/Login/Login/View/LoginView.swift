//
//  LoginView.swift
//  Login
//
//  Created by MacBook on 24/05/21.
//

import Foundation

protocol LoginView {
    func showError(message: String)
    func showToast(message: String)
}
