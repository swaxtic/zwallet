//
//  HistoryRouterImpl.swift
//  History
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import UIKit
import Core

public class HistoryRouterImpl {
    public static func navigateToModule(viewController: UIViewController) {
        let bundle = Bundle(identifier: "com.casestudy.History")
        let vc = HistoryViewController(nibName: "HistoryViewController", bundle: bundle)

        let invoiceNetworkManager = InvoiceNetworkManagerImpl()

        let router = HistoryRouterImpl()
        let interactor = HistoryInteractorImpl(invoiceNetworkManager: invoiceNetworkManager)
        let presenter = HistoryPresenterImpl(view: vc, interactor: interactor, router: router)

        interactor.interactorOutput = presenter

        vc.presenter = presenter
        // present
        //viewController.present(vc, animated: true, completion: nil)

//        UIApplication.shared.windows.first?.rootViewController = vc
//        UIApplication.shared.windows.first?.makeKeyAndVisible()
        viewController.navigationController?.setNavigationBarHidden(true, animated: false)
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HistoryRouterImpl: HistoryRouter {
    func navigateToHome(viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
}

