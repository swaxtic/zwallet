//
//  InputAmountDataSource.swift
//  InputAmount
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import UIKit
import Core

class InputAmountDataSource: NSObject, UITableViewDataSource {
    
    var viewController: InputAmountViewController!
    var selectedContact: ContactEntity = ContactEntity(id: 0, name: "", phone: "", imageUrl: "")
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! ContactCell
        cell.showData(contacts: self.selectedContact)
        cell.selectionStyle = .none
        return cell
    }
}
