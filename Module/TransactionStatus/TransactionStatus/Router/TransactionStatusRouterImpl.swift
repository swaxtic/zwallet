//
//  TransactionStatusRouterImpl.swift
//  TransactionStatus
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import UIKit
import Core

public class TransactionStatusRouterImpl {
    
    public static func navigationToModule(viewController: UIViewController, isSuccess: Bool){
        let bundle = Bundle(identifier: "com.casestudy.TransactionStatus")
        let vc = TransactionStatusViewController(nibName: "TransactionStatusViewController", bundle: bundle)
                
        let router = TransactionStatusRouterImpl()
        let presenter = TransactionStatusPresenterImpl(view: vc, router: router)

        //vc.isSuccess = isSuccess
        vc.isSuccess = isSuccess
        vc.presenter = presenter
        
        viewController.navigationController?.setNavigationBarHidden(true, animated: false)
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}

extension TransactionStatusRouterImpl: TransactionStatusRouter {
    
    func navigateBack(viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
    
    func navigateBackToHome(viewController: UIViewController) {
        viewController.navigationController?.popToRootViewController(animated: true)
    }
}
