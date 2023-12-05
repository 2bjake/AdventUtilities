//
//  Math.swift
//  
//
//  Created by Jake Foster on 12/10/22.
//

public func absDiff<T>(_ x: T, _ y: T) -> T where T : Comparable, T : SignedNumeric {
  abs(x - y)
}
