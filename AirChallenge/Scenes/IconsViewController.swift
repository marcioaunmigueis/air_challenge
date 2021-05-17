//
//  IconsViewController.swift
//  AirChallenge
//
//  Created by Marcio Migueis on 16/05/21.
//

import UIKit

class IconsViewController: UIViewController {
  
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet var tableView: UITableView!
  @IBOutlet weak var spinner: UIActivityIndicatorView!
  
  let cellReuseIdentifier = "IconCell"
  
  var presenter: IconsPresenter!
  var items = [Icon]()
  var loader = ImageLoader()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Custom Icons"
    presenter = IconsPresenter(controller: self)
    presenter.getData()
    let nib = UINib(nibName: "IconCell", bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: cellReuseIdentifier)
    self.navigationController?.navigationBar.prefersLargeTitles = true
    self.navigationController?.navigationBar.shadowImage = UIImage()
    self.searchBar.backgroundImage = UIImage()
  }
}

extension IconsViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    if searchText.count > 0 {
      presenter.search(term: searchText)
    } else {
      presenter.search(term: "")
    }
  }
}

extension IconsViewController: IconsDelegate {
  func showData(data: [Icon]) {
    self.items = data
    DispatchQueue.main.async{
      self.spinner.stopAnimating()
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

