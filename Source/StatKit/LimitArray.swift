import Foundation

public class LimitArray {

    private var values: [Int] = []
    private let limit: Int

    init(_ limit: Int) {
        self.limit = limit
    }

    init(_ limit: Int, _ values: [Int]) {
      self.limit = limit
      self.values = values
    }

    func append(_ data: Int) {
        values.append(data)
        if limit < values.count {
            values.remove(at: 0)
        }
    }

    func length() -> Int {
        return values.count
    }

    func sum() -> Double {
        return Double(values.reduce(0) { (previous, current) -> Int in
            previous + current
        })
    }

    // avg/average
    func mean() -> Double {
        return sum() / Double(values.count)
    }

    func median() -> Double {
        let sorted = values.sorted { $0 < $1 }
        if (sorted.count % 2) == 1 {
            return Double(sorted[(sorted.count - 1) / 2])
        }
        let half = sorted.count / 2
        return (Double(sorted[half - 1]) + Double(sorted[half])) / 2.0
    }

    func mode() -> Int {
        var counters: [Int : Int] = [:]
        for v in values {
            if let currentCount = counters[v] {
                counters[v] = currentCount + 1
            } else {
                counters[v] = 1
            }
        }

        let sorted = counters.sorted {
          $0.0 < $1.0
        }
        var tuple: (value: Int, count: Int) = (0, 0)
        for (key, count) in sorted {
            if tuple.count < count {
                tuple = (key, count)
            }
        }
        return tuple.value
    }

    func percentile(_ n: Int) -> Int {
        let sorted = values.sorted { $0 < $1 }
        let length = sorted.count
        let percent = Double(n) / 100.0
        let perIndex = Double(length) * percent
        let index = Int(perIndex) - 1
        return sorted[index]
    }

    func varianceSquares() -> [Double] {
        let m = mean()
        return values.map {
            let deviation = Double($0) - m
            return pow(deviation, 2)
        }
    }

    func variance() -> Double {
        let squares = varianceSquares()
        var sum = 0.0
        for v in squares {
            sum += v
        }
        return sum / Double(squares.count - 1)
    }

    func standardDeviation() -> Double {
        // Mean Square Error
        let vars = variance()
        return sqrt(vars)
    }

    func rmse() -> Double {
        // Root Mean Square Error
        let stdDev = standardDeviation()
        return stdDev / sqrt(Double(values.count))
    }

    func rmseRelativeError() -> Double {
      // RMSE relative error
      return (rmse() / mean()) * 100.0
    }
}
