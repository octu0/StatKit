import XCTest
@testable import StatKit

class LimitArrayTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testSum() {
        let a = LimitArray(4)
        a.append(1)
        a.append(2)
        a.append(3)
        a.append(4)
        
        XCTAssertEqual(a.sum(), 10)
    }

    func testLength() {
        let a1 = LimitArray(1)
        a1.append(1)
        a1.append(2)
        a1.append(3)
        a1.append(4)
        
        XCTAssertEqual(a1.length(), 1)

        let a2 = LimitArray(4)
        a2.append(1)
        a2.append(2)
        a2.append(3)
        a2.append(4)
        
        XCTAssertEqual(a2.length(), 4)
    }

    func testMean() {
        let a = LimitArray(4)
        a.append(1)
        a.append(2)
        a.append(3)
        a.append(4)

        XCTAssertEqual(a.mean(), 2.5)
    }

    func testMedian() {
        let a1 = LimitArray(4)
        a1.append(4)
        a1.append(1)
        a1.append(3)
        a1.append(2)

        XCTAssertEqual(a1.mean(), 2.5)

        let a2 = LimitArray(5)
        a2.append(5)
        a2.append(2)
        a2.append(3)
        a2.append(4)
        a2.append(1)

        XCTAssertEqual(a2.mean(), 3.0)
    }

    func testVarianceSquares() {
        let a = LimitArray(4)
        a.append(1)
        a.append(2)
        a.append(3)
        a.append(4)

        let res = a.varianceSquares()
        XCTAssertEqual(res[0], 2.25)
        XCTAssertEqual(res[1], 0.25)
        XCTAssertEqual(res[2], 0.25)
        XCTAssertEqual(res[3], 2.25)
    }

    func testVariance() {
        let a1 = LimitArray(4)
        a1.append(1)
        a1.append(2)
        a1.append(3)
        a1.append(4)

        let act1 = String(format: "%1.3f", a1.variance())
        let exp1 = String(format: "%1.3f", 1.666666)
        XCTAssertEqual(act1, exp1)

        let a2 = LimitArray(4, [4066, 3620, 613, 3471])
        let act2 = String(format: "%7.3f", a2.variance())
        let exp2 = String(format: "%7.3f", 2475713.6666)
        XCTAssertEqual(act2, exp2)

        let a3 = LimitArray(4, [166, 192, 3298, 3128])
        let act3 = String(format: "%7.3f", a3.variance())
        let exp3 = String(format: "%7.3f", 3073314.6666)
        XCTAssertEqual(act3, exp3)

        let a4 = LimitArray(4, [159, 166, 192, 3298])
        let act4 = String(format: "%7.3f", a4.variance())
        let exp4 = String(format: "%7.3f", 2442649.58333)
        XCTAssertEqual(act4, exp4)

        let a5 = LimitArray(4, [159, 159, 166, 192])
        let act5 = String(format: "%4.3f", a5.variance())
        let exp5 = String(format: "%4.3f", 246.000)
        XCTAssertEqual(act5, exp5)
    }

    func testStandardDeviation() {
        let a1 = LimitArray(4)
        a1.append(1)
        a1.append(2)
        a1.append(3)
        a1.append(4)
        
        let act1 = String(format: "%1.3f", a1.standardDeviation())
        let exp1 = String(format: "%1.3f", 1.290994)
        XCTAssertEqual(act1, exp1)

        let a2 = LimitArray(4, [4066, 3620, 613, 3471])
        let act2 = String(format: "%4.3f", a2.standardDeviation())
        let exp2 = String(format: "%4.3f", 1573.440074)
        XCTAssertEqual(act2, exp2)

        let a3 = LimitArray(4, [166, 192, 3298, 3128])
        let act3 = String(format: "%4.3f", a3.standardDeviation())
        let exp3 = String(format: "%4.3f", 1753.087181)
        XCTAssertEqual(act3, exp3)

        let a4 = LimitArray(4, [159, 166, 192, 3298])
        let act4 = String(format: "%4.3f", a4.standardDeviation())
        let exp4 = String(format: "%4.3f", 1562.89781)
        XCTAssertEqual(act4, exp4)

        let a5 = LimitArray(4, [159, 159, 166, 192])
        let act5 = String(format: "%4.3f", a5.standardDeviation())
        let exp5 = String(format: "%4.3f", 15.68438)
        XCTAssertEqual(act5, exp5)
    }

    func testMode() {
        let a1 = LimitArray(6)
        a1.append(1)
        a1.append(2)
        a1.append(2)
        a1.append(2)
        a1.append(3)
        a1.append(1)
        XCTAssertEqual(a1.mode(), 2)

        let a2 = LimitArray(6)
        a2.append(1)
        a2.append(2)
        a2.append(2)
        a2.append(2)
        a2.append(1)
        a2.append(1)
        XCTAssertEqual(a2.mode(), 1)

        let a3 = LimitArray(6)
        a3.append(2)
        a3.append(2)
        a3.append(2)
        a3.append(1)
        a3.append(1)
        a3.append(1)
        XCTAssertEqual(a3.mode(), 1)

        let a4 = LimitArray(6)
        a4.append(1)
        a4.append(1)
        a4.append(1)
        a4.append(2)
        a4.append(2)
        a4.append(2)
        XCTAssertEqual(a4.mode(), 1)
    }

    func testPercentile() {
        let a1 = LimitArray(8, [1, 1, 2, 2, 3, 3, 4, 4])
        XCTAssertEqual(a1.percentile(50), 2)
        XCTAssertEqual(a1.percentile(75), 3)
        XCTAssertEqual(a1.percentile(95), 4)
        XCTAssertEqual(a1.percentile(99), 4)
        XCTAssertEqual(a1.percentile(100), 4)

        let a2 = LimitArray(10, [1, 1, 1, 1, 1, 1, 2, 2, 9, 10])
        XCTAssertEqual(a2.percentile(50), 1)
        XCTAssertEqual(a2.percentile(75), 2)
        XCTAssertEqual(a2.percentile(95), 9)
        XCTAssertEqual(a2.percentile(99), 9)
        XCTAssertEqual(a2.percentile(100), 10)
    }

    func testRMSE() {
        let a1 = LimitArray(4, [4066, 3620, 613, 3471])
        let act1 = String(format: "%3.4f", a1.rmse())
        let exp1 = String(format: "%3.4f", 786.7200)
        XCTAssertEqual(act1, exp1)

        let a2 = LimitArray(4, [166, 192, 3298, 3128])
        let act2 = String(format: "%3.4f", a2.rmse())
        let exp2 = String(format: "%3.4f", 876.543590)
        XCTAssertEqual(act2, exp2)

        let a3 = LimitArray(4, [159, 166, 192, 3298])
        let act3 = String(format: "%3.4f", a3.rmse())
        let exp3 = String(format: "%3.4f", 781.448908)
        XCTAssertEqual(act3, exp3)

        let a4 = LimitArray(4, [159, 159, 166, 192])
        let act4 = String(format: "%3.4f", a4.rmse())
        let exp4 = String(format: "%3.4f", 7.8421935)
        XCTAssertEqual(act4, exp4)
    }

    func testRMSEre() {
        let a1 = LimitArray(4, [4066, 3620, 613, 3471])
        let act1 = String(format: "%3.4f", a1.rmseRelativeError())
        let exp1 = String(format: "%3.4f", 26.7364498)
        XCTAssertEqual(act1, exp1)

        let a2 = LimitArray(4, [166, 192, 3298, 3128])
        let act2 = String(format: "%3.4f", a2.rmseRelativeError())
        let exp2 = String(format: "%3.4f", 51.6829947)
        XCTAssertEqual(act2, exp2)

        let a3 = LimitArray(4, [159, 166, 192, 3298])
        let act3 = String(format: "%3.4f", a3.rmseRelativeError())
        let exp3 = String(format: "%3.4f", 81.93435470)
        XCTAssertEqual(act3, exp3)

        let a4 = LimitArray(4, [159, 159, 166, 192])
        let act4 = String(format: "%3.4f", a4.rmseRelativeError())
        let exp4 = String(format: "%3.4f", 4.640351225)
        XCTAssertEqual(act4, exp4)
    }

//    func testPerformanceSum() {
//        self.measure {
//        }
//    }

}
