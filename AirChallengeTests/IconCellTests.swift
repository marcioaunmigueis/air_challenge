//
//  IconTableViewCellTests.swift
//  AirChallengeTests
//
//  Created by Marcio Migueis on 16/05/21.
//

import XCTest
@testable import AirChallenge

class IconCellTests: XCTestCase {

  func test_outlets() {
    let vc = IconsViewController()
    vc.loadViewIfNeeded()
    let sut = vc.tableView.dequeueReusableCell(withIdentifier:  "IconCell") as! IconCell
    sut.awakeFromNib()
    sut.layoutIfNeeded()
    
    XCTAssertNotNil(sut.titleLabel)
    XCTAssertNotNil(sut.subtitleLabel)
    XCTAssertNotNil(sut.iconImage)
  }

}
