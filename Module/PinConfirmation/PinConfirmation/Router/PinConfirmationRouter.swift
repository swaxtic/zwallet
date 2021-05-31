//
//  PinConfirmationRouter.swift
//  PinConfirmation
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import UIKit

protocol PinConfirmationRouter {
    func navigateToTransactionResult(viewController: UIViewController, isSuccess: Bool)
    func navigateBackToHome(viewController: UIViewController)
}
