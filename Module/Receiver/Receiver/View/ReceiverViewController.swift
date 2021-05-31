//
//  ReceiverViewController.swift
//  Receiver
//
//  Created by MacBook on 26/05/21.
//

import UIKit
import Core

class ReceiverViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var searchContact: UISearchBar!
    @IBOutlet var receiverTableView: UITableView!
    @IBOutlet weak var labelContactCount: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var dataSource = ReceiverDataSource()
    var presenter: ReceiverPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTableReceiver()
        self.presenter?.loadDataReceiver()
        self.searchContact.delegate = self
        self.loadingIndicator.startAnimating()
    }

    func setupTableReceiver() {
        self.dataSource.viewController = self
        
        self.receiverTableView.register(UINib(nibName: "ContactCell", bundle: Bundle(identifier: "com.casestudy.Core")), forCellReuseIdentifier: "ContactCell")
        
        self.receiverTableView.dataSource = self.dataSource
        self.receiverTableView.delegate = self.dataSource
    }
    
    @IBAction func backTapAction(_ sender: UITapGestureRecognizer) {
        self.presenter?.backToHome(viewController: self)
    }
    
}

extension ReceiverViewController: ReceiverView {
    func showAllReceiver(receiverData: [ContactEntity]) {
        self.dataSource.receivers = receiverData
        self.dataSource.receiverFilter = receiverData
        self.receiverTableView.reloadData()
        self.labelContactCount.text = "\(receiverData.count) Contact found"
        self.loadingIndicator.stopAnimating()
    }
}

extension ReceiverViewController: ContactCellDelegate {
    func navigateToSetAmount(dataReceiver: ContactEntity) {
        self.presenter?.navigateToSetAmount(viewController: self, receiverData: dataReceiver)
    }
}

extension ReceiverViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        dataSource.receiverFilter = dataSource.receivers
        
        if searchText.isEmpty == false {
            dataSource.receiverFilter = dataSource.receivers.filter({$0.name.contains(searchText)})
            self.labelContactCount.text = "\(self.dataSource.receiverFilter.count) Contact found"
        } else {
            self.labelContactCount.text = "\(self.dataSource.receiverFilter.count) Contact found"
        }
        receiverTableView.reloadData()
    }
    
}
