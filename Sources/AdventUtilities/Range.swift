extension Range where Bound == Int {
  public static var empty: Range { 0..<0 }
}

extension ClosedRange where Bound: Comparable {
  public func contains(_ other: ClosedRange) -> Bool {
    self.contains(other.lowerBound) && self.contains(other.upperBound)
  }
}

extension Range {
  public var nonEmpty: Range? { isEmpty ? nil : self }
}

extension Range where Bound: Comparable {
  public func partition(by other: Range) -> (before: Range?, overlap: Range?, after: Range?) {
    let overlap = self.clamped(to: other)
    guard !overlap.isEmpty else {
      return self.lowerBound < other.lowerBound ? (self, nil, nil) : (nil, nil, self)
    }

    let before = self.clamped(to: self.lowerBound..<overlap.lowerBound)
    let after = self.clamped(to: overlap.upperBound..<self.upperBound)

    return (before.nonEmpty, overlap, after.nonEmpty)
  }
}
