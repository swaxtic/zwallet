//
//  EmptyDataCell.swift
//  Core
//
//  Created by MacBook on 31/05/21.
//

import UIKit

public class EmptyDataCell: UITableViewCell {

    @IBOutlet weak var labelText: UILabel!
    public override func awakeFromNib() {
        super.awakeFromNib()
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func showData(text: String){
        self.labelText.text = text
    }
}
