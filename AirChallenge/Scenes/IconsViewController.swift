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
    return 90.0
  }
}

extension IconsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let icon = items[indexPath.row]
    if let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? IconCell {
      cell.setup(icon: icon, loader: loader)
      return cell
    }
    return UITableViewCell()
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
}

