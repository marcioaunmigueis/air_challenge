//
//  IconsViewControllerTests.swift
//  AirChallengeTests
//
//  Created by Marcio Migueis on 16/05/21.
//

import XCTest
@testable import AirChallenge

class IconsViewControllerTests: XCTestCase {
  
  func test_tableViewOutlet_shouldBeConnected() {
    let sut = IconsViewController()
    
    sut.loadViewIfNeeded()
    
    XCTAssertNotNil(sut.tableView, "tableView")
  }
  
  
}
