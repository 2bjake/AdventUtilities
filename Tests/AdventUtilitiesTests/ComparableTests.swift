//
//  ComparableTests.swift
//  
//
//  Created by Jake Foster on 11/21/22.
//

import XCTest
import AdventUtilities

final class ComparableTests: XCTestCase {

    func testCompare() throws {
      XCTAssertEqual(1.compare(with: 2), -1)
      XCTAssertEqual(2.compare(with: 1), 1)
      XCTAssertEqual(1.compare(with: 1), 0)

    }
}
