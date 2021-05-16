//
//  IconsViewController.swift
//  AirChallenge
//
//  Created by Marcio Migueis on 16/05/21.
//

import UIKit

class IconsViewController: UIViewController {
  
  @IBOutlet var tableView: UITableView!

  var presenter: IconsPresenter!
  private var items = [Icon]()
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      presenter = IconsPresenter(controller: self)
      presenter.getData()
    }
    

 

}
extension IconsViewController: IconsDelegate {
  func showData(data: [Icon]) {
    self.items = data
    self.tableView.reloadData()
  }
}

extension IconsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }
}
