//
//  SceneDelegate.swift
//  App
//
//  Created by MacBook on 24/05/21.
//


// sebelum dapat di import perlu di tambahkan di framework and embedded content
import UIKit
import Core
import Login
import Home
import History
import SignUp
import CreatePin
import Receiver
import InputAmount
import ConfirmationTransaction
import PinConfirmation
import TransactionStatus

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        self.setupAppRouter()
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = scene
        
        self.reloadRootView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadRootView), name: Notification.Name("reloadRootView"), object: nil)
    }
    
    @objc func reloadRootView(){
        let token: String? = UserDefaultHelper.shared.get(key: .userToken)
        if token != nil {
            AppRouter.shared.navigateToHome()
        } else {
            AppRouter.shared.navigateToLogin()
        }
    }
    

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

@available(iOS 13.0, *)
extension SceneDelegate {
    func setupAppRouter() {
        AppRouter.shared.loginScene = {
            LoginRouterImpl.navigationToModule()
            // sebelum menggunakn module lain perlu menambah satu step lagi
            // tambahkan di framework and embedded content
            
        }
        
        AppRouter.shared.homeScene = {
            HomeRouterImpl.navigateToModule()
        }
        
        AppRouter.shared.historyScene = {(viewcontroller) in
            HistoryRouterImpl.navigateToModule(viewController: viewcontroller)
        }
        
        AppRouter.shared.signUpScene = {
            SignUpRouterImpl.navigateToModule()
        }
        
        AppRouter.shared.createPinScene = {
            CreatePinRouterImpl.navigationToModule()
        }
        
        AppRouter.shared.createReceiverScene = {(viewController) in
            ReceiverRouterImpl.navigateToModule(viewController: viewController)
        }
        
        AppRouter.shared.createSetAmountScene = { (viewController) in
            InputAmountRouterImpl.navigateToModule(viewController: viewController)
        }
        
        AppRouter.shared.createConfirmationTransactionScene = { (viewController) in
            ConfirmationTransactionRouterImpl.navigateToModule(viewController: viewController)
        }
        
        AppRouter.shared.createPinConfirmationScene = { (viewController) in
            PinConfirmationRouterImpl.navigationToModule(viewController: viewController)
        }
        
        AppRouter.shared.createTransactionStatusScene = { (viewController, isSuccess) in
            TransactionStatusRouterImpl.navigationToModule(viewController: viewController, isSuccess: isSuccess)
        }
        
    }
}
