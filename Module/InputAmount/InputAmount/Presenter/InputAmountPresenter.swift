//
//  InputAmountPresenter.swift
//  InputAmount
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import UIKit
import Core

public protocol InputAmountPresenter {
    func loadDataReceiver()
    func navigateToConfirmation(viewController: UIViewController, dataTransfer: TransferEntity)
    func backToReceiver(viewController: UIViewController)
}
