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
  @IBOutlet weak var shadowView: UIView!

  var onReuse: () -> Void = {}
  
  override func prepareForReuse() {
    super.prepareForReuse()
    onReuse()
    iconImage.image = nil
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // The shadow I did copying from StackOverflow
    self.detailView.layer.cornerRadius = 10
    self.detailView.layer.masksToBounds = true
    self.iconImage.layer.cornerRadius = 15
    self.shadowView.layer.masksToBounds = false
    self.shadowView.layer.shadowOffset = CGSize(width: 0, height: 0)
    self.shadowView.layer.shadowColor = UIColor.black.cgColor
    self.shadowView.layer.shadowOpacity = 0.23
    self.shadowView.layer.shadowRadius = 4
  }
  
  func setup(icon: Icon, loader: ImageLoader) {
    self.titleLabel.text = icon.title
    self.subtitleLabel.text = icon.subtitle
    
    let token = loader.loadImage(icon.imageURL) { result in
      do {
        let image = try result.get()
        DispatchQueue.main.async {
          self.iconImage.image = image
        }
      } catch {
        print(error)
      }
    }
    self.onReuse = {
      if let token = token {
        loader.cancelLoad(token)
      }
    }
  }
  
}
