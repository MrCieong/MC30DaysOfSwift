//
//  ArtistTableViewCell.swift
//  Artistry
//
//  Created by zhangjing on 16/7/7.
//  Copyright © 2016年 RayWenderlich. All rights reserved.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {

  @IBOutlet weak var artistNameLabel: UILabel!
  @IBOutlet weak var bioLabel: UILabel!
  @IBOutlet weak var artistImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
