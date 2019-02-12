# StatKit
Statistics library for Swift

This library contains:

- mean / median / mode / percentile
- variance sample
- standard deviation / mean square error (MSE) 
- root mean square error (RMSE) / RMSE Relative Error

# Example

```swift
let arr = LimitArray(3)
arr.append(1)
arr.append(2)
arr.append(2)
arr.append(4)

print("average = \(arr.mean())")
print("median = \(arr.median())")
print("mode = \(arr.mode())")
print("p95 = \(arr.percentile(95))")
print("variance = \(arr.variance())")
print("stddev = \(arr.standardDeviation())")
print("rmse = \(arr.rmse())")
print("rmsere = \(arr.rmseRelativeError())")
```
