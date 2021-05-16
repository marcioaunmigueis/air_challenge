//
//  IconsPresenter.swift
//  AirChallenge
//
//  Created by Marcio Migueis on 16/05/21.
//

import Foundation

protocol IconsDelegate {
  func showData()
}

class IconsPresenter {
  
  weak var controller: IconsViewController!
  
  init(controller: IconsViewController) {
    self.controller = controller
  }
  
  func getData() {
    controller.showData()
  }
  
}
