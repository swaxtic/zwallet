//
//  LoginInteractorImpl.swift
//  Login
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import Core

class LoginInteractorImpl: LoginInteractor {
    var interactorOutput: LoginInteractorOutput?
    let authNetworkManager: AuthNetworkManager
    
    init(networkManager: AuthNetworkManager) {
        self.authNetworkManager = networkManager
    }
    
    func postLoginData(email: String, password: String) {
        // hit api dengan email dan password
        self.authNetworkManager.login(email: email, password: password) { data, error in
            if let loginData = data?.data {
                UserDefaultHelper.shared.set(key: .email, value: loginData.email)
                UserDefaultHelper.shared.set(key: .userToken, value: loginData.token)
                UserDefaultHelper.shared.set(key: .refreshToken, value: loginData.refreshToken)
                
                let tokenExpiredDate: Date = Calendar.current.date(byAdding: .second, value: loginData.expiredIn / 1000, to: Date()) ?? Date()
                
                UserDefaultHelper.shared.set(key: .userTokenExpired, value: tokenExpiredDate)
                self.interactorOutput?.authenticationResult(isSuccess: true, status: data?.status ?? 0, message: data?.message ?? "", hasPin: loginData.hasPin)
            } else {
                self.interactorOutput?.authenticationResult(isSuccess: false, status: data?.status ?? 0, message: data?.message ?? "Login Gagal", hasPin: false)
            }
        }
    }
}
