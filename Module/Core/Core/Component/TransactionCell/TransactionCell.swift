//
//  TransactionCell.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import UIKit
import Kingfisher

public class TransactionCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellView.dropShadowEffect()
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    public func showData(transaction: TransactionEntity){
        self.nameLabel.text = transaction.name
        self.noteLabel.text = transaction.notes
        
        if transaction.type == "in" {
            self.amountLabel.text = "+\(transaction.amount.formatToIdr())"
            self.amountLabel.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        }else {
            self.amountLabel.text = "-\(transaction.amount.formatToIdr())"
            self.amountLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
        
        let url = URL(string: transaction.imageUrl)
        self.userImage.kf.setImage(with: url)
    }
    
}
