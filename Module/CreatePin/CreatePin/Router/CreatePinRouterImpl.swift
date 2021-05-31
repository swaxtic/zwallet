//
//  LoginRouterImpl.swift
//  Login
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import UIKit
import Core

public class CreatePinRouterImpl {
    
    public static func navigationToModule(){
        let bundle = Bundle(identifier: "com.casestudy.CreatePin")
        let vc = CreatePinViewController(nibName: "CreatePinViewController", bundle: bundle)
        
        let networkManager = AuthNetworkManagerImpl()
        
        let router = CreatePinRouterImpl()
        let interactor = CreatePinInteractorImpl(networkManager: networkManager)
        let presenter = CreatePinPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        
        vc.presenter = presenter
        
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}

extension CreatePinRouterImpl: CreatePinRouter {
   
    func navigateToLogin() {
        AppRouter.shared.navigateToLogin()
    }
}
