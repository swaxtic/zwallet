//
//  PinConfirmationRouterImpl.swift
//  PinConfirmation
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import UIKit
import Core

public class PinConfirmationRouterImpl {
    
    public static func navigationToModule(viewController: UIViewController){
        let bundle = Bundle(identifier: "com.casestudy.PinConfirmation")
        let vc = PinConfirmationViewController(nibName: "PinConfirmationViewController", bundle: bundle)
        
        let networkManager = TransferNetworkManagerImpl()
        
        let router = PinConfirmationRouterImpl()
        let interactor = PinConfirmationInteractorImpl(transferNetworkManager: networkManager)
        let presenter = PinConfirmationPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        
        vc.presenter = presenter
        
        viewController.navigationController?.setNavigationBarHidden(true, animated: false)
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}

extension PinConfirmationRouterImpl: PinConfirmationRouter {
    func navigateToTransactionResult(viewController: UIViewController, isSuccess: Bool) {
        AppRouter.shared.navigateToTransactionStatus(viewController, isSuccess: isSuccess)
    }
    
    func navigateBackToHome(viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
}
