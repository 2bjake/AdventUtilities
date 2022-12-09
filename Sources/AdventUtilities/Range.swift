extension Range where Bound == Int {
  public static var empty: Range { 0..<0 }
}

extension ClosedRange where Bound: Comparable {
  public func contains(_ other: ClosedRange) -> Bool {
    self.contains(other.lowerBound) && self.contains(other.upperBound)
  }
}
