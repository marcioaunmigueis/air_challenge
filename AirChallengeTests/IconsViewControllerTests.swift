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
  
  func test_searchBar_hasDelegate() {
    XCTAssertNotNil(sut.searchBar.delegate, "searchBar delegate")
  }
  
  func test_searchBar_textDidChange() {
    let icon1 = Icon(title: "Tomato", subtitle: "for pasta sauce", image: "https://a-tomato.com/1")
    let icon2 = Icon(title: "Lemon", subtitle: "for risoto", image: "https://an-icon.com/2")
    sut.items = [icon1, icon2]
    sut.searchBar.text = ""
    sut.searchBar.delegate?.searchBar?(sut.searchBar, textDidChange: "L")
    sut.tableView.reloadData()
    XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
  }
}
