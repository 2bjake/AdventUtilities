import Algorithms

extension Collection {
  // requires collection to be sorted before calling
  func firstIfUnique<Subject: Equatable>(on projection: (Element) throws -> Subject) rethrows -> Element? {
    guard let first = self.first else { return nil }
    if let second = self.second, try projection(first) == projection(second) { return nil }
    return first
  }
}

extension Collection where Element: Equatable {
  // requires collection to be sorted before calling
  func firstIfUnique() -> Element? {
    firstIfUnique { $0 }
  }
}

extension Collection where Element: Hashable {
  // O(n)
  public func occurrenceCounts() -> [(element: Element, count: Int)] {
    self
      .reduce(into: [:]) { result, value in result[value, default: 0] += 1 }
      .map { (element: $0.key, count: $0.value) }
  }

  public func leastCommon() -> Element? {
    occurrenceCounts()
      .min(count: 2, sortedBy: sorter(for: \.count))
      .firstIfUnique(on: \.count)?
      .element
  }

  public func mostCommon() -> Element? {
    return occurrenceCounts()
      .max(count: 2, sortedBy: sorter(for: \.count))
      .reversed()
      .firstIfUnique(on: \.count)?
      .element
  }
}

extension Collection {
  public var only: Element? {
    guard self.count == 1 else { return nil }
    return self.first
  }
}

extension Collection {
  public var second: Element? {
    self.dropFirst().first
  }
}

extension Collection {
  public var notEmpty: Bool { !isEmpty }
}

extension Collection where Element: Comparable {
  public func isSorted() -> Bool {
    self.adjacentPairs().allSatisfy { first, second in first <= second }
  }
}

extension Collection {
  public func halved() -> (front: Self.SubSequence, back: Self.SubSequence)? {
    guard count > 0 && count.isMultiple(of: 2) else { return nil }
    return (prefix(count / 2), suffix(count / 2))
  }
}
