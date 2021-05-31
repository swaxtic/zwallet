//
//  DetailCell.swift
//  ConfirmationTransaction
//
//  Created by MacBook on 30/05/21.
//

import UIKit
import Kingfisher
import Core

class DetailCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var amountTransferLabel: UILabel!
    @IBOutlet weak var dateTimeTransferLabel: UILabel!
    @IBOutlet weak var noteTransferLabel: UILabel!
    @IBOutlet weak var contactView: UIView!
    
    @IBOutlet weak var amountView: UIView!
    @IBOutlet weak var balanceView: UIView!
    @IBOutlet weak var dateTimeView: UIView!
    @IBOutlet weak var notesView: UIView!
    
    var delegate: DetailCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setDropShadow()
    }
    
    func showData(contactData: ContactEntity, transferData: TransferEntity, userBalance: Int){
        
        let currentDate: String = ""
        
        self.nameLabel.text = contactData.name
        self.balanceLabel.text = "\((userBalance - transferData.amount).formatToIdr())"
        self.phoneNumberLabel.text = contactData.phone
        let url = URL(string: contactData.imageUrl)
        self.profileImage.kf.setImage(with: url)
        
        self.amountTransferLabel.text = transferData.amount.formatToIdr()
        self.dateTimeTransferLabel.text = currentDate.getCurrentDate
        self.noteTransferLabel.text = transferData.notes
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setDropShadow(){
        self.contactView.dropShadowEffect()
        self.amountView.dropShadowEffect()
        self.balanceView.dropShadowEffect()
        self.dateTimeView.dropShadowEffect()
        self.notesView.dropShadowEffect()
    }
    
    @IBAction func confirmTransactionAction(_ sender: Any) {
        self.delegate?.confirmTransaction()
    }
}

