//
//  IconsViewController.swift
//  AirChallenge
//
//  Created by Marcio Migueis on 16/05/21.
//

import UIKit

class IconsViewController: UIViewController {
  
  @IBOutlet var tableView: UITableView!
  let cellReuseIdentifier = "IconCell"
  
  var presenter: IconsPresenter!
  var items = [Icon]()
  var loader = ImageLoader()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    presenter = IconsPresenter(controller: self)
    presenter.getData()
    let nib = UINib(nibName: "IconCell", bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: cellReuseIdentifier)
  }
}

extension IconsViewController: IconsDelegate {
  func showData(data: [Icon]) {
    self.items = data
    DispatchQueue.main.async{
      self.tableView.reloadData()
    }
  }
}


extension IconsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80.0
  }
}

extension IconsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let icon = items[indexPath.row]
    if let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? IconCell {
      cell.titleLabel.text = icon.title
      cell.subtitleLabel.text = icon.subtitle
      cell.detailView.layer.cornerRadius = 10
      
      //      let token = loader.loadImage(icon.imageURL) { result in
      //        do {
      //          let image = try result.get()
      //          DispatchQueue.main.async {
      //            cell.iconImage.image = image
      //          }
      //        } catch {
      //          print(error)
      //        }
      //      }
      //      cell.onReuse = {
      //        if let token = token {
      //          self.loader.cancelLoad(token)
      //        }
      //      }
      return cell
    }
    return UITableViewCell()
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
}

