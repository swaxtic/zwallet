//
//  InputAmountRouter.swift
//  InputAmount
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import UIKit
import Core

public protocol InputAmountRouter {
    func navigateToReceiver(viewController: UIViewController)
    func navigateToConfirmation(viewController: UIViewController, dataTransfer: TransferEntity)
}
