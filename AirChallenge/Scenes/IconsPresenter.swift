//
//  IconsPresenter.swift
//  AirChallenge
//
//  Created by Marcio Migueis on 16/05/21.
//

import Foundation
import Combine

protocol IconsDelegate {
  func showData(data: [Icon])
}

class IconsPresenter {
  
  var cancellables = Set<AnyCancellable>()
  weak var controller: IconsViewController!
  var iconNetwork = IconNetwork()
  
  init(controller: IconsViewController) {
    self.controller = controller
  }
  
  func getData() {
    let url = "https://irapps.github.io/wzpsolutions/tests/ios-custom-icons/IconsData.json"
    let urlRequest = URL(string: url)!
    let publisher: AnyPublisher<Icons, Error> = iconNetwork.fetchURL(urlRequest)
    publisher.sink(receiveCompletion: { _ in },
                       receiveValue: { [weak self] (model: Icons) in
      self?.controller.showData(data: model.icons)
    }).store(in: &cancellables)
  }
  
}
