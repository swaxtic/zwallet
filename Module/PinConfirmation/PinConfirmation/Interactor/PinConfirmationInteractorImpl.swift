//
//  PinConfirmationInteractorImpl.swift
//  PinConfirmation
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import Core

class PinConfirmationInteractorImpl: PinConfirmationInteractor {
    
    var interactorOutput: PinConfirmationInteractorOutput?
    let transferNetworkManager: TransferNetworkManager
    
    init(transferNetworkManager: TransferNetworkManager) {
        self.transferNetworkManager = transferNetworkManager
    }
    
    func postTransactionData(pin: String) {
        let dataTransfer = UserDefaultHelper.shared.getDataTransfer()
        self.transferNetworkManager.transfer(pin: pin, receiver: dataTransfer?.receiver ?? 0, amount: dataTransfer?.amount ?? 0, notes: dataTransfer?.notes ?? "") { (data, error) in
//            if data?.status == 200 {
//                self.interactorOutput?.createTransactionResult(isSuccess: true, status: data?.status ?? 0)
//            } else {
//                self.interactorOutput?.createTransactionResult(isSuccess: false, status: data?.status ?? 0)
//            }
            if let dataResponse = data {
                self.interactorOutput?.createTransactionResult(isSuccess: true, status: dataResponse.status)
            } else {
                self.interactorOutput?.createTransactionResult(isSuccess: false, status: data?.status ?? 0)
            }
        }
    }
}
