//
//  QuizCell.swift
//  ExpanseOnDemand
//
//  Created by Apple on 08/08/18.
//  Copyright © 2018 AmarDRS. All rights reserved.
//

import UIKit

class QuizCell: UITableViewCell {

    @IBOutlet weak var answerSelectionIMG: UIImageView!
    @IBOutlet weak var answerLBL: UILabel!
    let utility = Utility()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        utility.MakeCircularView(inputView: answerSelectionIMG)
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
