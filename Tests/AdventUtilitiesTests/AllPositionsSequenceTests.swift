//
//  AllPositionsSequenceTests.swift
//  
//
//  Created by Jake Foster on 11/21/22.
//

import XCTest
import AdventUtilities

final class AllPositionsSequenceTests: XCTestCase {
    func testAllPositions() throws {
      let rowCount = 20
      let colCount = 30
      let array = Array(repeating: Array(repeating: 1, count: colCount), count: rowCount)

      var positions = ArraySlice(array.allPositions)
      XCTAssertEqual(positions.count, rowCount * colCount)
      for i in 0..<rowCount {
        for j in 0..<colCount {
          XCTAssertEqual(positions.removeFirst(), Position(i, j))
        }
      }
      XCTAssertTrue(positions.isEmpty)
    }

//  func testAllPositionsEmpty() throws {
//    let array = [[Int]]()
//    XCTAssertTrue(Array(array.allPositions).isEmpty)
//  }
}
