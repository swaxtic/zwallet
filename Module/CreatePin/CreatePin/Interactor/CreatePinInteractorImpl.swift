//
//  LoginInteractorImpl.swift
//  Login
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import Core

class CreatePinInteractorImpl: CreatePinInteractor {
    
    var interactorOutput: CreatePinInteractorOutput?
    let authNetworkManager: AuthNetworkManager
    
    init(networkManager: AuthNetworkManager) {
        self.authNetworkManager = networkManager
    }
    
    func postPinData(pin: String) {
        self.authNetworkManager.setPin(pin: pin) { (data, error) in
            if data?.status == 200 {
                self.interactorOutput?.createPinResult(isSuccess: true, status: data?.status ?? 200, message: data?.message ?? "Berhasil")
            } else {
                self.interactorOutput?.createPinResult(isSuccess: false, status: data?.status ?? 0, message: data?.message ?? "Gagal")
            }
        }
    }
}
