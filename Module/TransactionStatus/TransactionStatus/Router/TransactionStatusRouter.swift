//
//  TransactionStatusRouter.swift
//  TransactionStatus
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import UIKit

protocol TransactionStatusRouter {
    func navigateBack(viewController: UIViewController)
    func navigateBackToHome(viewController: UIViewController)
}
