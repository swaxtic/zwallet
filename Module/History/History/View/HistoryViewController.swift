//
//  HistoryViewController.swift
//  History
//
//  Created by MacBook on 25/05/21.
//

import UIKit
import Core
class HistoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filterCashOut: UIButton!
    @IBOutlet weak var filterCashIn: UIButton!
    @IBOutlet weak var filterByDate: UIButton!
    
    var dataSource = HistoryDataSource()
    var presenter: HistoryPresenter?
    var isButtonInSelected: Bool = false
    var isButtonOutSelected: Bool = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.loadAllTransaction()
        self.presenter?.loadThisWeekTransaction()
        self.setupTableView()
        self.filterCashIn.dropShadowEffect()
        self.filterCashOut.dropShadowEffect()
        self.filterByDate.dropShadowEffect()
    }
    
    func setupTableView(){
        self.dataSource.viewController = self
        self.tableView.register(UINib(nibName: "TransactionCell", bundle: Bundle(identifier: "com.casestudy.Core")), forCellReuseIdentifier: "TransactionCell")
        
        self.tableView.dataSource = self.dataSource
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.presenter?.goBackToHome(viewController: self)
    }
    
    @IBAction func filterByCashOutAction(_ sender: Any) {
        self.isButtonInSelected = false
        self.filterCashIn.backgroundColor = UIColor.white
        self.dataSource.transactionsFilter = dataSource.transactions
        if !self.isButtonOutSelected {
            dataSource.transactionsFilter = dataSource.transactions.filter({$0.type == "out"})
            self.isButtonOutSelected = true
            self.filterCashOut.backgroundColor = UIColor(named: "ZwalletPrimary", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
        } else {
            self.isButtonOutSelected = false
            self.filterCashOut.backgroundColor = UIColor.white
            self.filterCashOut.tintColor = UIColor.white
        }
        self.tableView.reloadData()
        
    }
    @IBAction func filterByCashInAction(_ sender: Any) {
        self.isButtonOutSelected = false
        self.filterCashOut.backgroundColor = UIColor.white
        self.dataSource.transactionsFilter = dataSource.transactions
        if !self.isButtonInSelected {
            dataSource.transactionsFilter = dataSource.transactions.filter({$0.type == "in"})
            self.isButtonInSelected = true
            self.filterCashIn.backgroundColor = UIColor(named: "ZwalletPrimary", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
        } else {
            self.isButtonInSelected = false
            self.filterCashIn.backgroundColor = UIColor.white
        }
        self.tableView.reloadData()
    }
}

extension HistoryViewController: HistoryView {
    func showTransactionData(transactions: [TransactionEntity]) {
        self.dataSource.transactions = transactions
        self.dataSource.transactionsFilter = transactions
        self.tableView.reloadData()
    }    
}
