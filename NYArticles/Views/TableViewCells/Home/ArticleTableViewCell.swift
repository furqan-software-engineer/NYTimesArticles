//
//  ArticleTableViewCell.swift
//  NYArticles
//
//  Created by Furqan on 01/04/2019.
//  Copyright © 2019 Muhammad Furqan. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblDate: UILabel!

    @IBOutlet weak var viewCircular: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewCircular.layer.cornerRadius = viewCircular.bounds.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
