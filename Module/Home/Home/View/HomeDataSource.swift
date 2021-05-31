//
//  HomeDataSource.swift
//  Home
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import UIKit
import Core

class HomeDataSource: NSObject, UITableViewDataSource {
    
    var viewController: HomeViewController!
    
    var userProfile: UserProfileEntity = UserProfileEntity(name: "", balance: 0, phoneNumber: "", imageUrl: "")
    var transactions: [TransactionEntity] = []
    var text: String = "Data Masih Kosong"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            if transactions.count == 0 {
                return 1
            } else {
                return transactions.count
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardCell", for: indexPath) as! DashboardCell
            cell.selectionStyle = .none
            cell.showData(userProfile: self.userProfile)
            cell.delegate = self.viewController
            return cell
        } else {
            if transactions.count == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyDataCell", for: indexPath) as! EmptyDataCell
                cell.selectionStyle = .none
                cell.showData(text: "Anda Belum Memiliki Riwayat Transaksi")
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! TransactionCell
                cell.selectionStyle = .none
                cell.showData(transaction: self.transactions[indexPath.row])
                return cell
            }
        }
    }
}
