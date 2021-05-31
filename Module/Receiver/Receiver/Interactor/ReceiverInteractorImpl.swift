//
//  ReceiverInteractorImpl.swift
//  Receiver
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import UIKit
import Core

class ReceiverInteractorImpl: ReceiverInteractor {
    var interactorOutput: ReceiverInteractorOutput?
    
    let contactNetworkManager: TransferNetworkManager
    
    init(contactNetworkManager: TransferNetworkManager) {
        self.contactNetworkManager = contactNetworkManager
    }
    
    func getReceiverData() {
        self.contactNetworkManager.getAllContact { (data, error) in
            var dataContact: [ContactEntity] = []
            data?.data.forEach({ (data) in
                dataContact.append(ContactEntity(id: data.id, name: data.name, phone: data.phone, imageUrl: "\(AppConstant.baseUrl)\(data.image)"))
            })
            self.interactorOutput?.loadedDataReceiver(contacts: dataContact)
        }
    }
}
