//
//  CGPointTests.swift
//  Munch
//
//  Created by mrahmiao on 9/5/16.
//  Copyright © 2016 NSTweak. All rights reserved.
//

import XCTest
import Munch

class CGPointTests: XCTestCase {

  let accuracy: CGFloat = 0.000001

  let point = CGPoint(x: 50, y: 50)
  let another = CGPoint(x: 20, y: 30)
  let scalar: CGFloat = 5

  func testAddsAnotherCGPoint() {
    let result = point + another

    XCTAssertEqualWithAccuracy(result.x, point.x + another.x, accuracy: accuracy)
    XCTAssertEqualWithAccuracy(result.y, point.y + another.y, accuracy: accuracy)
  }

  func testAddsAScalar() {
    let result = point + scalar

    XCTAssertEqualWithAccuracy(result.x, point.x + scalar, accuracy: accuracy)
    XCTAssertEqualWithAccuracy(result.y, point.y + scalar, accuracy: accuracy)
  }

  func testSubtractsAnotherCGPoint() {
    let result = point - another

    XCTAssertEqualWithAccuracy(result.x, point.x - another.x, accuracy: accuracy)
    XCTAssertEqualWithAccuracy(result.y, point.y - another.y, accuracy: accuracy)
  }

  func testSubtractsAScalar() {
    let result = point - scalar

    XCTAssertEqualWithAccuracy(result.x, point.x - scalar, accuracy: accuracy)
    XCTAssertEqualWithAccuracy(result.y, point.y - scalar, accuracy: accuracy)
  }

  func testMultipliesAScalar() {
    let result = point * scalar

    XCTAssertEqualWithAccuracy(result.x, point.x * scalar, accuracy: accuracy)
    XCTAssertEqualWithAccuracy(result.y, point.y * scalar, accuracy: accuracy)
  }

  func testDividesAScalar() {
    let result = point / scalar

    XCTAssertEqualWithAccuracy(result.x, point.x / scalar, accuracy: accuracy)
    XCTAssertEqualWithAccuracy(result.y, point.y / scalar, accuracy: accuracy)
  }
}
