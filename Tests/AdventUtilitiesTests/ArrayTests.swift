//
//  ArrayTests.swift
//  
//
//  Created by Jake Foster on 11/21/22.
//

import XCTest
import AdventUtilities

final class ArrayTests: XCTestCase {
  func testTranspose() throws {
    let array = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]

    let expected = [
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9]
    ]

    XCTAssertEqual(array.transpose(), expected)
  }

  func testTransposeEmpty() throws {
    XCTAssertTrue([[Int]]().transpose().isEmpty)
  }

  func testColumn() throws {
    let array = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]

    XCTAssertEqual(array.column(at: 0), [1, 4, 7])
    XCTAssertEqual(array.column(at: 1), [2, 5, 8])
    XCTAssertEqual(array.column(at: 2), [3, 6, 9])
  }

  func testElement() throws {
    let array = [1, 2, 3]
    XCTAssertEqual(array.element(at: 0), 1)
    XCTAssertNil(array.element(at: 5))
    XCTAssertNil(array.element(at: -1))
  }

}
