//
//  CreatePinViewController.swift
//  CreatePin
//
//  Created by MacBook on 26/05/21.
//

import UIKit
import OTPFieldView

class CreatePinViewController: UIViewController {
    
    @IBOutlet weak var otpTextFieldView: OTPFieldView!
    @IBOutlet weak var createPinView: UIView!
    @IBOutlet weak var viewSuccess: UIView!
    
    var otp: String = ""
    var presenter: CreatePinPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewSuccess.isHidden = true
        setupOtpView()
    }
    @IBAction func confirmPinAction(_ sender: Any) {
        self.presenter?.createPin(pin: otp)
    }
    @IBAction func toLoginPageAction(_ sender: Any) {
        self.presenter?.navigateToLogin()
    }
    
}

extension CreatePinViewController: CreatePinView {
    func showSuccess() {
        self.createPinView.isHidden = true
        self.viewSuccess.isHidden = false
    }
    
    func showMessage(message: String) {
        let alert = UIAlertController(title: "Peringatan", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func setupOtpView(){
        self.otpTextFieldView.fieldsCount = 6
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

extension CreatePinViewController: OTPFieldViewDelegate {
    func hasEnteredAllOTP(hasEnteredAll hasEntered: Bool) -> Bool {
        return false
    }
    
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otp otpString: String) {
        self.otp = otpString
    }
}
