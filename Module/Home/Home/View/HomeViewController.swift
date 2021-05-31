//
//  HomeViewController.swift
//  Home
//
//  Created by MacBook on 24/05/21.
//

import UIKit
import Core

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var dataSource = HomeDataSource()
    var presenter: HomePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        
        self.presenter?.loadProfile()
        self.presenter?.loadTransaction()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.viewDidLoad()
    }
    
    func setupTableView(){
        self.dataSource.viewController = self
        self.tableView.register(UINib(nibName: "DashboardCell", bundle: Bundle(identifier: "com.casestudy.Home")), forCellReuseIdentifier: "DashboardCell")
        self.tableView.register(UINib(nibName: "TransactionCell", bundle: Bundle(identifier: "com.casestudy.Core")), forCellReuseIdentifier: "TransactionCell")
        self.tableView.register(UINib(nibName: "EmptyDataCell", bundle: Bundle(identifier: "com.casestudy.Core")), forCellReuseIdentifier: "EmptyDataCell")
        
        self.tableView.dataSource = self.dataSource
    }
}

extension HomeViewController: DashboardCellDelegate {
    func selectReceiver() {
        self.presenter?.selectReceiver(viewController: self)
    }
    
    func showAllTransaction() {
        self.loadingIndicator.startAnimating()
        self.presenter?.showHistory(viewController: self)
    }
    
    func logout() {
        self.presenter?.logout()
    }
}

extension HomeViewController: HomeView {
    func showUserProfileData(userProfile: UserProfileEntity) {
        self.dataSource.userProfile = userProfile
        self.tableView.reloadData()
    }
    
    func showTransactionData(transactions: [TransactionEntity]) {
        self.dataSource.transactions = transactions
        self.tableView.reloadData()
        self.loadingIndicator.stopAnimating()
    }
    
    
}
