//
//  TransactionStatusDataSource.swift
//  TransactionStatus
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import UIKit
import Core

class TransactionStatusDataSource: NSObject, UITableViewDataSource {
    
    var viewController: TransactionStatusViewController!

    var dataContact: ContactEntity = ContactEntity(id: 0, name: "", phone: "", imageUrl: "")
    var dataTransfer: TransferEntity = TransferEntity(receiver: 0, amount: 0, notes: "")
    var userBalance: Int = 0
    var statusTransaction: Bool = false
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionStatusCell", for: indexPath) as! TransactionStatusCell
        cell.delegate = self.viewController
        cell.selectionStyle = .none
        cell.showData(contactData: dataContact, transferData: dataTransfer, transactionStatus: statusTransaction, userBalance: self.userBalance)
        return cell
    }
}
