//
//  PinConfirmationViewController.swift
//  PinConfirmation
//
//  Created by MacBook on 29/05/21.
//

import UIKit
import Core
import OTPFieldView

class PinConfirmationViewController: UIViewController {
    @IBOutlet weak var backButtonUI: UIButton!
    @IBOutlet weak var pinTextField: UITextField!
    @IBOutlet weak var otpTextFieldView: OTPFieldView!
    
    var presenter: PinConfirmationPresenter?
    var otp: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupAppearance()
        self.setupOtpView()
    }
    
    func setupAppearance() {
        self.backButtonUI.setImage(UIImage(named: "Arrow_Left", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil), for: .normal)
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.presenter?.navigateBackToHome(viewController: self)
    }
    @IBAction func transferButtonAction(_ sender: Any) {
        self.presenter?.createTransaction(pin: self.otp)
//        self.presenter?.navigateToTransactionResult(viewController: self)
    }
}

extension PinConfirmationViewController: OTPFieldViewDelegate {
    func hasEnteredAllOTP(hasEnteredAll hasEntered: Bool) -> Bool {
        return false
    }
    
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otp otpString: String) {
        self.otp = otpString
    }
    
    func setupOtpView(){
        self.otpTextFieldView.fieldsCount = 6
        self.otpTextFieldView.secureEntry = true
        self.otpTextFieldView.fieldBorderWidth = 2
        self.otpTextFieldView.defaultBorderColor = UIColor.black
        self.otpTextFieldView.filledBorderColor = #colorLiteral(red: 0.3882352941, green: 0.4745098039, blue: 0.9568627451, alpha: 1)
        self.otpTextFieldView.cursorColor = UIColor.red
        self.otpTextFieldView.displayType = .roundedCorner
        self.otpTextFieldView.fieldSize = 47
        self.otpTextFieldView.separatorSpace = 10
        self.otpTextFieldView.shouldAllowIntermediateEditing = false
        self.otpTextFieldView.delegate = self
        self.otpTextFieldView.initializeUI()
    }
}

extension PinConfirmationViewController: PinConfirmationView {
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Peringatan", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
        
    func showTransactionResult(isSuccess: Bool, status: Int) {
        if isSuccess {
            if status == 200 {
                PinConfirmationViewController.showToast("Transaction Success")
                self.presenter?.navigateToTransactionResult(viewController: self, isSuccess: true)
            }
        } else {
            self.presenter?.navigateToTransactionResult(viewController: self, isSuccess: false)
        }
    }
}
