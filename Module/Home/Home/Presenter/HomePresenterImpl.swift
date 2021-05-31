//
//  HomePresenterImpl.swift
//  Home
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import UIKit
import Core

class HomePresenterImpl: HomePresenter {
    
    let view: HomeView
    let interactor: HomeInteractor
    let router: HomeRouter
    
    init(view: HomeView, interactor: HomeInteractor, router: HomeRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func loadProfile() {
        self.interactor.getUserProfile()
    }
    
    func loadTransaction() {
        self.interactor.getTransaction()
    }
    
    func showHistory(viewController: UIViewController) {
        self.router.navigateToHistory(viewController: viewController)
    }
    
    func logout() {
        UserDefaultHelper.shared.remove(key: .userToken)
        UserDefaultHelper.shared.remove(key: .email)
        UserDefaultHelper.shared.remove(key: .refreshToken)
        self.router.navigateToLogin()
    }
    func selectReceiver(viewController: UIViewController) {
        self.router.navigateToSelectReceiver(viewController: viewController)
    }
        
}

extension HomePresenterImpl: HomeInteractorOutput {
    
    func loadedUserProfileData(userProfile: UserProfileEntity) {
        self.view.showUserProfileData(userProfile: userProfile)
    }
    
    func loadedTransaction(transactions: [TransactionEntity]) {
        self.view.showTransactionData(transactions: transactions)
    }
}

