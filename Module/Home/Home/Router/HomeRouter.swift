//
//  HomeRouter.swift
//  Home
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import UIKit

protocol HomeRouter {
    func navigateToHistory(viewController: UIViewController)
    func navigateToSelectReceiver(viewController: UIViewController)
    func navigateToLogin()
}
