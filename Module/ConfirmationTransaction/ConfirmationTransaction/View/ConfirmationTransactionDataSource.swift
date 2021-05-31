//
//  ConfirmationTransactionDataSource.swift
//  ConfirmationTransaction
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import UIKit
import Core

class ConfirmationTransactionDataSource: NSObject, UITableViewDataSource {
    
    var viewController: ConfirmationTransactionViewController!

    var dataContact: ContactEntity = ContactEntity(id: 0, name: "", phone: "", imageUrl: "")
    var dataTransfer: TransferEntity = TransferEntity(receiver: 0, amount: 0, notes: "")
    var userBalance: Int = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailCell
        cell.selectionStyle = .none
        cell.delegate = self.viewController
        cell.showData(contactData: dataContact, transferData: dataTransfer, userBalance: userBalance)
        return cell
    }
}
