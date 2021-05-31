//
//  SignUpRouterImpl.swift
//  SignUp
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import Core
import UIKit

public class SignUpRouterImpl {
    public static func navigateToModule() {
        let bundle = Bundle(identifier: "com.casestudy.SignUp")
        let vc = SignUpViewController(nibName: "SignUpViewController", bundle: bundle)
        
        let authNetworkManager = AuthNetworkManagerImpl()
        
        let router = SignUpRouterImpl()
        let interactor = SignUpInteractorImpl(networkManager: authNetworkManager)
        let presenter = SignUpPresenterImpl(view: vc, interactor: interactor, router: router)

        interactor.interactorOutput = presenter

        vc.presenter = presenter
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}

extension SignUpRouterImpl: SignUpRouter {
    func navigateToLogin() {
        AppRouter.shared.navigateToLogin()
    }
    
    func navigateToCreatePin() {
        AppRouter.shared.navigateToCreatePin()
    }
}
