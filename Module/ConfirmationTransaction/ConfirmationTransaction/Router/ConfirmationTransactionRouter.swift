//
//  ConfirmationTransactionRouter.swift
//  ConfirmationTransaction
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import UIKit
import Core

public protocol ConfirmationTransactionRouter {
    func navigateToSetAmount(viewController: UIViewController)
    func navigateToInputPin(viewController: UIViewController)
}
