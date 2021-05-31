//
//  ReceiverDataSource.swift
//  Receiver
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import UIKit
import Core

protocol ReceiverDataSourceDelegate: AnyObject {
    func navigateToTransaction()
}

class ReceiverDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
   var viewController: ReceiverViewController!
    var receivers: [ContactEntity] = []
    var receiverFilter: [ContactEntity] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receiverFilter.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! ContactCell
        
        cell.showData(contacts: self.receiverFilter[indexPath.row])
        cell.delegate = self.viewController
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
