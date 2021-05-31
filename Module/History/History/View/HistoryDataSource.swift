//
//  HistoryDataSource.swift
//  History
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import UIKit
import Core

class HistoryDataSource: NSObject, UITableViewDataSource {
    
    let arrayHeader: Array = ["This Week", "This Month"]
    
    var viewController: HistoryViewController!
    
    var transactions: [TransactionEntity] = []
    var transactionsFilter: [TransactionEntity] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return transactionsFilter.count
        } else {
            return transactionsFilter.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! TransactionCell
            cell.selectionStyle = .none
            cell.showData(transaction: self.transactionsFilter[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! TransactionCell
            cell.selectionStyle = .none
            cell.showData(transaction: self.transactionsFilter[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrayHeader[section]
    }
        
}
