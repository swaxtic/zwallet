//
//  SignUpViewController.swift
//  SignUp
//
//  Created by MacBook on 26/05/21.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var presenter: SignUpPresenter?

    @IBOutlet weak var signUpView: UIView!
    @IBOutlet weak var activateAccountView: UIView!
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var otpText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupAppearance()
        activateAccountView.isHidden = true
        signUpView.isHidden = false
    }
    
    func setupAppearance () {
        self.usernameText.setIcon(UIImage(named: "Person_Grey", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil) ?? UIImage())
        self.emailText.setIcon(UIImage(named: "Mail_Grey", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil) ?? UIImage())
        self.passwordText.setIcon(UIImage(named: "Lock_Grey", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil) ?? UIImage())
        
        self.usernameText.addBottomBorder()
        self.emailText.addBottomBorder()
        self.passwordText.addBottomBorder()
    }
    
    @IBAction func toLoginAction(_ sender: Any) {
        presenter?.navigateToLogin()
    }
    @IBAction func signUpAction(_ sender: Any) {
        presenter?.signup(username: usernameText.text ?? "", email: emailText.text ?? "", password: passwordText.text ?? "")
    }
    @IBAction func activateAction(_ sender: Any) {
        self.presenter?.activateAccount(email: emailText.text ?? "", otp: otpText.text ?? "")
    }
}

extension SignUpViewController: SignUpView {
    func showToast(message: String) {
        SignUpViewController.showToast(message)
    }
    
    func showActivateField() {
        activateAccountView.isHidden = false
        signUpView.isHidden = true
    }
    
    func showMessage(message: String) {
        let alert = UIAlertController(title: "Peringatan", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
