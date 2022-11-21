//
//  IntTests.swift
//  
//
//  Created by Jake Foster on 11/21/22.
//

import XCTest
import AdventUtilities

final class IntTests: XCTestCase {
  func testInitChar() throws {
    XCTAssertEqual(Int("3" as Character), 3)
    XCTAssertNil(Int("A" as Character))
    XCTAssertEqual(Int("A" as Character, radix: 16), 10)
  }

  func testInitSubstring() throws {
    XCTAssertEqual(Int("32" as Substring), 32)
    XCTAssertNil(Int("A23" as Substring))
    XCTAssertEqual(Int("AA" as Substring, radix: 16), 170)
  }

  func testAdvance() throws {
    var start = 3
    let target = 10
    var advanceCount = 0
    while start != target {
      start.advance(toward: target)
      advanceCount += 1
    }
    XCTAssertEqual(start, target)
    XCTAssertEqual(advanceCount, 7)
  }

  func testSquareRoot() throws {
    XCTAssertEqual(9.squareRoot(), 3)
  }
}
