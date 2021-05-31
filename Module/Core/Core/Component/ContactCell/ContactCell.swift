//
//  ContactCell.swift
//  Core
//
//  Created by MacBook on 27/05/21.
//

import UIKit
import Kingfisher

public class ContactCell: UITableViewCell {
    
    public var delegate: ContactCellDelegate?

    
    @IBOutlet weak var cellContent: UIView!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberPhoneLabel: UILabel!
    @IBOutlet weak var contactImage: UIImageView!
    
    var dataReceiver: ContactEntity = ContactEntity(id: 0, name: "", phone: "", imageUrl: "")
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        
        cellView.addGestureRecognizer(tap)
        cellView.dropShadowEffect()
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func showData(contacts: ContactEntity){
        
        self.nameLabel.text = contacts.name
        self.numberPhoneLabel.text = contacts.phone
        self.dataReceiver = contacts
        
        let url = URL(string: contacts.imageUrl)
        self.contactImage.kf.setImage(with: url)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        self.delegate?.navigateToSetAmount(dataReceiver: self.dataReceiver)
    }
    
}
