//
//  TransactionStatusViewController.swift
//  TransactionStatus
//
//  Created by MacBook on 29/05/21.
//

import Core
import UIKit

class TransactionStatusViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = TransactionStatusDataSource()
    var presenter: TransactionStatusPresenter?
    
    var data: ContactEntity = ContactEntity(id: 0, name: "", phone: "", imageUrl: "")
    var dataTransfer: TransferEntity = TransferEntity(receiver: 0, amount: 0, notes: "")
    var isSuccess: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.loadDataTransfer(isSuccess: self.isSuccess)
        self.setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
        
    func setupTableView(){
        self.dataSource.viewController = self
        self.tableView.register(UINib(nibName: "TransactionStatusCell", bundle: Bundle(identifier: "com.casestudy.TransactionStatus")), forCellReuseIdentifier: "TransactionStatusCell")
        self.tableView.dataSource = self.dataSource
    }
}

extension TransactionStatusViewController: TransactionStatusView {
    
    func showTransferData(receiverData: ContactEntity, transferData: TransferEntity, isSuccess: Bool, userBalance: Int) {
        self.dataSource.dataContact = receiverData
        self.dataSource.dataTransfer = transferData
        self.dataSource.statusTransaction = isSuccess
        self.dataSource.userBalance = userBalance
    }
}

extension TransactionStatusViewController: TransactionStatusCellDelegate {
    func confirmTransaction() {
        if self.isSuccess {
            self.presenter?.navigateBack(viewController: self, isSuccess: true)
        } else {
            self.presenter?.navigateBack(viewController: self, isSuccess: false)
        }
    }
}
