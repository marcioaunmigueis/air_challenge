//
//  IconCell.swift
//  AirChallenge
//
//  Created by Marcio Migueis on 16/05/21.
//

import UIKit

class IconCell: UITableViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var subtitleLabel: UILabel!
  @IBOutlet weak var iconImage: UIImageView!
  @IBOutlet weak var detailView: UIView!
  
  var onReuse: () -> Void = {}
  
  override func prepareForReuse() {
    super.prepareForReuse()
    onReuse()
    iconImage.image = nil
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    //    roudedView.layer.cornerRadius = 10
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
