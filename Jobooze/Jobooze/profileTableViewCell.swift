
//  JobTableViewCell.swift
//  Jobooze
//
//  Created by Andy Celdo on 5/9/21.
//

import UIKit
import Parse
import AlamofireImage

class profileTableViewCell: UITableViewCell {

    @IBOutlet weak var jobStatus: UILabel!
    @IBOutlet weak var companyName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
