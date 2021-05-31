//
//  ConfirmationTransactionPresenter.swift
//  ConfirmationTransaction
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import UIKit
import Core

public protocol ConfirmationTransactionPresenter {
    func loadDataTransfer()
    func navigateToInputPin(viewController: UIViewController)
    func backToSetAmount(viewController: UIViewController)
}
