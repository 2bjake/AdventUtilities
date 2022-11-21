//
//  PositionTests.swift
//  
//
//  Created by Jake Foster on 11/21/22.
//

import XCTest
import AdventUtilities

final class PositionTests: XCTestCase {
  func testAdd() throws {
    let pos = Position(1, 2)
    XCTAssertEqual(pos + (3, 5), Position(4, 7))
  }

  func testSubtract() throws {
    let pos = Position(1, 2)
    XCTAssertEqual(pos - (3, 5), Position(-2, -3))
  }

  func testNext() throws {
    let pos = Position(1, 2)
    let target = Position(3, -2)
    XCTAssertEqual(pos.next(toward: target), Position(2, 1))
  }

  func testAdjacentPositions() throws {
    let adjacents = Position(3, 4).adjacentPositions()
    XCTAssertEqual(adjacents.count, 4)
    XCTAssertTrue(adjacents.contains(Position(2, 4)))
    XCTAssertTrue(adjacents.contains(Position(4, 4)))
    XCTAssertTrue(adjacents.contains(Position(3, 3)))
    XCTAssertTrue(adjacents.contains(Position(3, 5)))
  }

  func testAdjacentPositionsDiagonals() throws {
    let adjacents = Position(3, 4).adjacentPositions(includingDiagonals: true)
    XCTAssertEqual(adjacents.count, 8)
    XCTAssertTrue(adjacents.contains(Position(2, 3)))
    XCTAssertTrue(adjacents.contains(Position(2, 4)))
    XCTAssertTrue(adjacents.contains(Position(2, 5)))

    XCTAssertTrue(adjacents.contains(Position(3, 3)))
    XCTAssertTrue(adjacents.contains(Position(3, 5)))

    XCTAssertTrue(adjacents.contains(Position(4, 3)))
    XCTAssertTrue(adjacents.contains(Position(4, 4)))
    XCTAssertTrue(adjacents.contains(Position(4, 5)))
  }

  func testMoved() throws {
    let pos = Position(3, 4)
    XCTAssertEqual(pos.moved(.left), Position(3, 3))
    XCTAssertEqual(pos.moved(.right), Position(3, 5))
    XCTAssertEqual(pos.moved(.up), Position(2, 4))
    XCTAssertEqual(pos.moved(.down), Position(4, 4))
  }

  func testMove() throws {
    var pos = Position(3, 4)
    pos.move(.left)
    XCTAssertEqual(pos, Position(3, 3))
    pos.move(.right)
    XCTAssertEqual(pos, Position(3, 4))
    pos.move(.up)
    XCTAssertEqual(pos, Position(2, 4))
    pos.move(.down)
    XCTAssertEqual(pos, Position(3, 4))
  }

  func testNumberOfRowsCols() throws {
    let array = [
      [1, 2, 3],
      [4, 5, 6]
    ]

    XCTAssertEqual(array.numberOfRows, 2)
    XCTAssertEqual(array.numberOfColumns, 3)

  }

  func testNumberOfRowsColsEmpty() throws {
    let empty = [[Int]]()

    XCTAssertEqual(empty.numberOfRows, 0)
    XCTAssertEqual(empty.numberOfColumns, 0)

    let array: [[Int]] = [[], []]

    XCTAssertEqual(array.numberOfRows, 2)
    XCTAssertEqual(array.numberOfColumns, 0)

  }

  func testPositionSubscript() throws {
    let array = [
      [1, 2, 3],
      [4, 5, 6]
    ]
    XCTAssertEqual(array[Position(1, 2)], 6)
  }

  func testIsValidPosition() throws {
    let array = [
      [1, 2, 3],
      [4, 5, 6]
    ]

    XCTAssertTrue(array.isValidPosition(Position(1, 2)))
    XCTAssertFalse(array.isValidPosition(Position(5, 5)))
  }

  func testElementAtPosition() throws {
    let array = [
      [1, 2, 3],
      [4, 5, 6]
    ]

    XCTAssertEqual(array.element(atPosition: Position(1, 2)), 6)
    XCTAssertNil(array.element(atPosition: Position(5, 5)))
  }

  func testAdjacentPositionsArray() throws {
    let array = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]

    let positions = array.adjacentPositions(of: Position(1, 1))
    XCTAssertEqual(positions.count, 4)
    XCTAssertTrue(positions.contains(Position(0, 1)))
    XCTAssertTrue(positions.contains(Position(2, 1)))
    XCTAssertTrue(positions.contains(Position(1, 0)))
    XCTAssertTrue(positions.contains(Position(1, 2)))

    let cornerPositions = array.adjacentPositions(of: Position(0, 0))
    XCTAssertEqual(cornerPositions.count, 2)
    XCTAssertTrue(positions.contains(Position(0, 1)))
    XCTAssertTrue(positions.contains(Position(1, 0)))
  }

  func testAdjacentPositionsWithDiagonalsArray() throws {
    let array = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]

    let positions = array.adjacentPositions(of: Position(1, 1), includingDiagonals: true)
    XCTAssertEqual(positions.count, 8)
    XCTAssertTrue(positions.contains(Position(0, 0)))
    XCTAssertTrue(positions.contains(Position(0, 1)))
    XCTAssertTrue(positions.contains(Position(0, 2)))

    XCTAssertTrue(positions.contains(Position(1, 0)))
    XCTAssertTrue(positions.contains(Position(1, 2)))

    XCTAssertTrue(positions.contains(Position(2, 0)))
    XCTAssertTrue(positions.contains(Position(2, 1)))
    XCTAssertTrue(positions.contains(Position(2, 2)))

    let cornerPositions = array.adjacentPositions(of: Position(0, 0), includingDiagonals: true)
    XCTAssertEqual(cornerPositions.count, 3)
    XCTAssertTrue(cornerPositions.contains(Position(0, 1)))
    XCTAssertTrue(cornerPositions.contains(Position(1, 0)))
    XCTAssertTrue(cornerPositions.contains(Position(1, 1)))
  }

}
