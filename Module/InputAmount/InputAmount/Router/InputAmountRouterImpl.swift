//
//  InputAmountRouterImpl.swift
//  InputAmount
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import UIKit
import Core

public class InputAmountRouterImpl {
    public static func navigateToModule(viewController: UIViewController) {
        let bundle = Bundle(identifier: "com.casestudy.InputAmount")
        let vc = InputAmountViewController(nibName: "InputAmountViewController", bundle: bundle)
        
        let router = InputAmountRouterImpl()
        let presenter = InputAmountPresenterImpl(view: vc, router: router)
        
        vc.presenter = presenter
        vc.modalPresentationStyle = .fullScreen
        viewController.navigationController?.setNavigationBarHidden(true, animated: false)
        viewController.navigationController?.pushViewController(vc, animated: true)
        presenter.loadDataReceiver()
    }
}

extension InputAmountRouterImpl: InputAmountRouter {
    public func navigateToConfirmation(viewController: UIViewController, dataTransfer: TransferEntity) {
        UserDefaultHelper.shared.setDataTransfer(value: dataTransfer)
        AppRouter.shared.navigateToConfirmationTransaction(viewController)
    }
    
    public func navigateToReceiver(viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
}
