//
//  TransactionStatusCell.swift
//  TransactionStatus
//
//  Created by MacBook on 30/05/21.
//

import UIKit

import Kingfisher
import Core

class TransactionStatusCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var amountTransferLabel: UILabel!
    @IBOutlet weak var dateTimeTransferLabel: UILabel!
    @IBOutlet weak var noteTransferLabel: UILabel!
    
    @IBOutlet weak var amountView: UIView!
    @IBOutlet weak var balanceView: UIView!
    @IBOutlet weak var dateTimeView: UIView!
    @IBOutlet weak var notesView: UIView!
    @IBOutlet weak var receiverView: UIView!
    
    
    @IBOutlet weak var buttonView: UIButton!
    @IBOutlet weak var transactionStatusLabel: UILabel!
    @IBOutlet weak var transactionStatusIcon: UIImageView!
    @IBOutlet weak var transactionStatusImageView: UIView!
    @IBOutlet weak var transactionStatusDescription: UILabel!
    
    var delegate: TransactionStatusCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func showData(contactData: ContactEntity, transferData: TransferEntity, transactionStatus: Bool, userBalance: Int){
        
        self.setAppearance(status: transactionStatus)
        
        let currentDate: String = ""
        
        self.nameLabel.text = contactData.name
        self.balanceLabel.text = "\((userBalance - transferData.amount).formatToIdr())"
        
        self.phoneNumberLabel.text = contactData.phone
        let url = URL(string: contactData.imageUrl)
        self.profileImage.kf.setImage(with: url)
        
        self.amountTransferLabel.text = transferData.amount.formatToIdr()
        self.dateTimeTransferLabel.text = currentDate.getCurrentDate
        self.noteTransferLabel.text = transferData.notes
        
        self.setDropShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setAppearance(status: Bool) {
        if status {
            self.transactionStatusLabel.text = "Transfer Success"
            self.transactionStatusDescription.text = ""
            self.transactionStatusImageView.backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.7568627451, blue: 0.3725490196, alpha: 1)
            self.transactionStatusIcon.image = UIImage(named: "Check_Icon", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
        } else {
            self.transactionStatusLabel.text = "Transfer Failed"
            self.transactionStatusImageView.backgroundColor = #colorLiteral(red: 1, green: 0.3568627451, blue: 0.2156862745, alpha: 1)
            self.transactionStatusIcon.image = UIImage(named: "Failed_Icon", in: Bundle(identifier: "com.casestudy.Core"), compatibleWith: nil)
            self.buttonView.setTitle("Try Again", for: .normal)
        }
    }
    
    func setDropShadow(){
        self.amountView.dropShadowEffect()
        self.balanceView.dropShadowEffect()
        self.dateTimeView.dropShadowEffect()
        self.notesView.dropShadowEffect()
        self.receiverView.dropShadowEffect()
    }
    
    @IBAction func confirmTransactionAction(_ sender: Any) {
        self.delegate?.confirmTransaction()
    }
}
