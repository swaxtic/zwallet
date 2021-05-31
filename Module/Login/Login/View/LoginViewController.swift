//
//  LoginViewController.swift
//  Login
//
//  Created by MacBook on 24/05/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    var presenter: LoginPresenter?

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupAppearance()
        self.loadingIndicator.stopAnimating()
    }
    
    func setupAppearance () {
        self.emailTextField.setIcon(UIImage(named: "Mail_Grey", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil) ?? UIImage())
        self.passwordTextField.setIcon(UIImage(named: "Lock_Grey", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil) ?? UIImage())
        self.emailTextField.addBottomBorder()
        self.passwordTextField.addBottomBorder()
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let email: String = emailTextField.text ?? ""
        let password: String = passwordTextField.text ?? ""
        self.loadingIndicator.startAnimating()
        self.presenter?.login(email: email, password: password)
    }
    @IBAction func toSignUpAction(_ sender: Any) {
        self.presenter?.navigateToSignUp()
    }
}

extension LoginViewController: LoginView {
    func showToast(message: String) {
        LoginViewController.showToast(message)
        self.loadingIndicator.stopAnimating()
    }
    
    func showError(message: String) {
        self.loadingIndicator.stopAnimating()
        let alert = UIAlertController(title: "Peringatan", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
