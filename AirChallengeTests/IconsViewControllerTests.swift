//
//  IconsViewControllerTests.swift
//  AirChallengeTests
//
//  Created by Marcio Migueis on 16/05/21.
//

import XCTest
import UIKit
@testable import AirChallenge

class IconsViewControllerTests: XCTestCase {
  
  var sut: IconsViewController!
  
  override func setUp() {
    sut = IconsViewController()
    sut.loadViewIfNeeded()
  }
  
  
  func test_tableViewOutlet_shouldBeConnected() {
    XCTAssertNotNil(sut.tableView, "tableView")
  }
  
  func test_tableView_shouldHasADelegate() {
    XCTAssertNotNil(sut.tableView.delegate, "tableView delegate")
  }
  
  func test_tableView_shouldHasADataSource() {
    XCTAssertNotNil(sut.tableView.dataSource,"tableView datasource")
  }
  
  func test_showData_shouldUpdateNumbersOfIcons() {
    sut.showData(data: [Icon(title: "test", subtitle: "little test", image: "")])
                        XCTAssertEqual(sut.items.count, 1)
  }
  
  func test_numberOfRows_afterShowData() {
    sut.showData(data: [Icon(title: "test", subtitle: "little test", image: "")])
    let numberOfItems = sut.tableView.numberOfRows(inSection: 0)
    XCTAssertEqual(numberOfItems, 1)
  }
  
}
