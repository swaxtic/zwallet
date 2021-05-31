//
//  PinConfirmationPresenter.swift
//  PinConfirmation
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import UIKit

protocol PinConfirmationPresenter {
    func createTransaction(pin: String)
    func navigateToTransactionResult(viewController: UIViewController, isSuccess: Bool)
    func navigateBackToHome(viewController: UIViewController)
}
