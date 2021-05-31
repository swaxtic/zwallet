//
//  AppRouter.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import UIKit

public class AppRouter {
    public static let shared: AppRouter = AppRouter()
    
    public var loginScene: (() -> ())? = nil
    
    public func navigateToLogin() {
        self.loginScene?()
    }
    
    public var homeScene: (() -> ())? = nil
    
    public func navigateToHome() {
        self.homeScene?()
    }
    
    public var historyScene: ((_ viewController: UIViewController) -> ())? = nil
    
    public func navigateToHistory(_ viewController: UIViewController){
        self.historyScene?(viewController)
    }
    
    public var signUpScene: (() -> ())? = nil
    
    public func navigateToSignUp(){
        self.signUpScene?()
    }
    
    public var createPinScene: (() -> ())? = nil
    
    public func navigateToCreatePin(){
        self.createPinScene?()
    }
    
    public var createReceiverScene: ((_ viewController: UIViewController) -> ())? = nil
    
    public func navigateToReceiver (_ viewController: UIViewController){
        self.createReceiverScene?(viewController)
    }
    
    public var createSetAmountScene: ((_ viewController: UIViewController) -> ())? = nil
    
    public func navigateToSetAmount (_ viewController: UIViewController) {
        self.createSetAmountScene?(viewController)
    }
    
    public var createConfirmationTransactionScene: ((_ viewController: UIViewController) -> ())? = nil
    
    public func navigateToConfirmationTransaction (_ viewController: UIViewController) {
        self.createConfirmationTransactionScene?(viewController)
    }
    
    public var createPinConfirmationScene: ((_ viewController: UIViewController) -> ())? = nil
    
    public func navigateToPinConfirmation (_ viewController: UIViewController) {
        self.createPinConfirmationScene? (viewController)
    }
    
    public var createTransactionStatusScene: ((_ viewController: UIViewController, _ isSuccess: Bool) -> ())? = nil
    
    public func navigateToTransactionStatus (_ viewController: UIViewController, isSuccess: Bool) {
        self.createTransactionStatusScene? (viewController, isSuccess)
    }
}
