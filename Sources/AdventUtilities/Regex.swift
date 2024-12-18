//
//  Regex.swift
//  AdventUtilities
//
//  Created by Jake Foster on 12/1/24.
//

import RegexBuilder

@available(macOS 13.0, *)
extension Capture<(Substring, Int)> {
  public static let int = Capture {
    Optionally { "-" }
    OneOrMore(.digit)
  } transform: { Int($0)! }
}

