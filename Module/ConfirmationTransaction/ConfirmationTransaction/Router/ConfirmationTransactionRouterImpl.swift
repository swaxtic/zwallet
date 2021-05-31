//
//  ConfirmationTransactionImpl.swift
//  ConfirmationTransaction
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import UIKit
import Core

public class ConfirmationTransactionRouterImpl {
    public static func navigateToModule(viewController: UIViewController) {
        let bundle = Bundle(identifier: "com.casestudy.ConfirmationTransaction")
        let vc = ConfirmationTransactionViewController(nibName: "ConfirmationTransactionViewController", bundle: bundle)

        let router = ConfirmationTransactionRouterImpl()
        let presenter = ConfirmationTransactionPresenterImpl(view: vc, router: router)

        vc.presenter = presenter
        viewController.navigationController?.setNavigationBarHidden(true, animated: false)
        viewController.navigationController?.pushViewController(vc, animated: true)
        presenter.loadDataTransfer()
    }
}

extension ConfirmationTransactionRouterImpl: ConfirmationTransactionRouter {
    public func navigateToSetAmount(viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
    
    public func navigateToInputPin(viewController: UIViewController) {
        AppRouter.shared.navigateToPinConfirmation(viewController)
    }
}
