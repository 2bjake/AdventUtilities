//
//  CollectionTests.swift
//  
//
//  Created by Jake Foster on 11/21/22.
//

import XCTest
@testable import AdventUtilities

final class CollectionTests: XCTestCase {
  func testFirstIfUnique() throws {
    let foo = [1, 2, 3]
    XCTAssertEqual(foo.firstIfUnique(), 1)

    let bar = [1, 1, 2]
    XCTAssertNil(bar.firstIfUnique())
  }

  func testFirstIfUniqueProjection() throws {
    let foo = [1, 2, 3]
    XCTAssertEqual(foo.firstIfUnique { $0 % 2 }, 1)

    let bar = [1, 3, 2]
    XCTAssertNil(bar.firstIfUnique { $0 % 2 })
  }

  func testOccurrenceCounts() throws {
    var array = [Int]()
    for i in 1..<6 {
      array += Array(repeating: i + 100, count: i)
    }

    let occurrenceCounts = array.occurrenceCounts()
    XCTAssertEqual(occurrenceCounts.count, 5)
    for (value, count) in occurrenceCounts {
      XCTAssertEqual(value, count + 100)
    }
  }

  func testLeastCommon() throws {
    let foo = [3, 3, 3, 2, 2, 2, 1, 1]
    XCTAssertEqual(foo.leastCommon(), 1)

    let bar = [1, 2, 3]
    XCTAssertNil(bar.leastCommon())
  }

  func testMostCommon() throws {
    let foo = [3, 3, 3, 2, 2, 1, 1]
    XCTAssertEqual(foo.mostCommon(), 3)

    let bar = [1, 2, 3]
    XCTAssertNil(bar.mostCommon())
  }

  func testOnly() throws {
    XCTAssertNil([1, 2, 3].only)
    XCTAssertEqual([1].only, 1)
  }

  func testSecond() throws {
    XCTAssertNil([1].second)
    XCTAssertEqual([1, 2].second, 2)
  }

  func testNotEmpty() throws {
    XCTAssertTrue([1, 2].notEmpty)
    XCTAssertFalse([Int]().notEmpty)
  }

  func testIsSorted() throws {
    XCTAssertTrue([1, 2, 3, 4, 5].isSorted())
    XCTAssertFalse([1, 3, 2, 4].isSorted())
  }
}
