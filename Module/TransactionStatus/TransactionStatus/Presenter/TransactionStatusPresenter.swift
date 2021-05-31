//
//  TransactionStatusPresenter.swift
//  TransactionStatus
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import UIKit

protocol TransactionStatusPresenter {
    func loadDataTransfer(isSuccess: Bool)
    func navigateBack(viewController: UIViewController, isSuccess: Bool)
}
