//
//  SignUpInteractorImpl.swift
//  SignUp
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import Core

class SignUpInteractorImpl: SignUpInteractor {
    
    var interactorOutput: SignUpInteractorOutput?
    let authNetworkManager: AuthNetworkManager
    
    init(networkManager: AuthNetworkManager) {
        self.authNetworkManager = networkManager
    }
    
    func postSignUpData(username: String, email: String, password: String) {
        // hit api dengan email dan password
        self.authNetworkManager.signup(username: username, email: email, pasword: password) { data, error in
            if data?.status==200 || data?.status==401 {
                // memberi tahu presenter
                self.interactorOutput?.signUpResult(isSuccess: true, message: data?.message ?? "")
            }else {
                // memberi tahu presenter jika tidak berhasil
                self.interactorOutput?.signUpResult(isSuccess: false, message: data?.message ?? "")
            }
        }
    }
    
    func postActivateToken(email: String, otp: String) {
        self.authNetworkManager.activateToken(email: email, otp: otp) { (data, error) in
            if data?.status==200 || data?.status==201 {
                self.interactorOutput?.activateResult(isSuccess: true, message: data?.message ?? "")
            } else {
                self.interactorOutput?.activateResult(isSuccess: false, message: data?.message ?? "")
            }
        }
    }
}


