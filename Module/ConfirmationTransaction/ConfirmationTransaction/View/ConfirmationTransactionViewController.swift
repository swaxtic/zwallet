//
//  ConfirmationTransactionViewController.swift
//  ConfirmationTransaction
//
//  Created by MacBook on 29/05/21.
//

import UIKit
import Core

class ConfirmationTransactionViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = ConfirmationTransactionDataSource()
    var presenter: ConfirmationTransactionPresenter?
    
    var data: ContactEntity = ContactEntity(id: 0, name: "", phone: "", imageUrl: "")
    var dataTransfer: TransferEntity = TransferEntity(receiver: 0, amount: 0, notes: "")

    @IBOutlet weak var backButtonUI: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadAppearance()
        self.setupTableView()
        self.presenter?.loadDataTransfer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    func loadAppearance(){
        self.backButtonUI.setImage(UIImage(named: "Arrow_Left", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil), for: .normal)
    }
    
    func setupTableView(){
        self.dataSource.viewController = self
        self.tableView.register(UINib(nibName: "DetailCell", bundle: Bundle(identifier: "com.casestudy.ConfirmationTransaction")), forCellReuseIdentifier: "DetailCell")
        self.tableView.dataSource = self.dataSource
    }

    @IBAction func backButtonAction(_ sender: Any) {
        self.presenter?.backToSetAmount(viewController: self)
    }
    @IBAction func navigateToInputPinAction(_ sender: Any) {
        self.presenter?.navigateToInputPin(viewController: self)
    }
}

extension ConfirmationTransactionViewController: ConfirmationTransactionView {
    func showTransferData(receiverData: ContactEntity, transferData: TransferEntity, userBalance: Int) {
        self.dataSource.dataContact = receiverData
        self.dataSource.dataTransfer = transferData
        self.dataSource.userBalance = userBalance
    }
}

extension ConfirmationTransactionViewController: DetailCellDelegate {
    func confirmTransaction() {
        self.presenter?.navigateToInputPin(viewController: self)
    }
}
