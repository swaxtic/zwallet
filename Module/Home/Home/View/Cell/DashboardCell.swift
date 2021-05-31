//
//  DashboardCell.swift
//  Home
//
//  Created by MacBook on 24/05/21.
//

import UIKit
import Kingfisher
import Core

class DashboardCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    var delegate: DashboardCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func showData(userProfile: UserProfileEntity){
        self.nameLabel.text = userProfile.name
        self.balanceLabel.text = userProfile.balance.formatToIdr()
        self.phoneNumberLabel.text = userProfile.phoneNumber
        
        let url = URL(string: userProfile.imageUrl)
        
        self.profileImage.kf.setImage(with: url)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func addTransactionAction(_ sender: Any) {
        self.delegate?.selectReceiver()
    }
    @IBAction func topUpTransactionAction(_ sender: Any) {
    }
    @IBAction func showTransactionAction(_ sender: Any) {
        self.delegate?.showAllTransaction()
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        self.delegate?.logout()
    }
    
}
