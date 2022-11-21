//
//  DictionaryTests.swift
//  
//
//  Created by Jake Foster on 11/21/22.
//

import XCTest
import AdventUtilities

final class DictionaryTests: XCTestCase {
  func testFlip() throws {
    let dict = [
      1: "1",
      2: "2",
      3: "3",
      4: "4"
    ]

    let expected = [
      "1": 1,
      "2": 2,
      "3": 3,
      "4": 4,
    ]

    XCTAssertEqual(dict.flipWithUniqueValues(), expected)
  }
}
