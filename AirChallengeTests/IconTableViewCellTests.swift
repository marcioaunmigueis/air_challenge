//
//  IconTableViewCellTests.swift
//  AirChallengeTests
//
//  Created by Marcio Migueis on 16/05/21.
//

import XCTest
@testable import AirChallenge

class IconTableViewCellTests: XCTestCase {

  func test_outlets() {
    let vc = IconsViewController()
    vc.loadViewIfNeeded()
    let sut = vc.tableView.dequeueReusableCell(withIdentifier:  "IconTableViewCell") as! IconTableViewCell
    sut.awakeFromNib()
    sut.layoutIfNeeded()
    
    XCTAssertNotNil(sut.title)
    XCTAssertNotNil(sut.subtitle)
  }

}
