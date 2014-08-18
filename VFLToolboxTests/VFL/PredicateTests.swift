import UIKit
import XCTest
import VFLToolbox

class PredicateTests: XCTestCase {

    func testEqualPredicate() {
        let predicate = ==1
        XCTAssertEqual(predicate.constant, 1, "Constant should be properly set")
        XCTAssertEqual(predicate.relation, NSLayoutRelation.Equal, "Relation should be properly set")
    }

    func testLessThanOrEqualPredicate() {
        let predicate = <=15
        XCTAssertEqual(predicate.constant, 15, "Constant should be properly set")
        XCTAssertEqual(predicate.relation, NSLayoutRelation.LessThanOrEqual, "Relation should be properly set")
    }
    
    func testGreaterThanOrEqualPredicate() {
        let predicate = >=24
        XCTAssertEqual(predicate.constant, 24, "Constant should be properly set")
        XCTAssertEqual(predicate.relation, NSLayoutRelation.GreaterThanOrEqual, "Relation should be properly set")
    }

    func testIntConversion() {
        let constant: Int = -1
        let predicate = ==constant
        XCTAssertEqual(predicate.constant, -1, "Constant should be properly set")
    }
    func testUIntConversion() {
        let constant: UInt = 2
        let predicate = <=constant
        XCTAssertEqual(predicate.constant, 2, "Constant should be properly set")
    }
    func testInt8Conversion() {
        let constant: Int8 = -3
        let predicate = >=constant
        XCTAssertEqual(predicate.constant, -3, "Constant should be properly set")
    }
    func testUInt8Conversion() {
        let constant: UInt8 = 4
        let predicate = ==constant
        XCTAssertEqual(predicate.constant, 4, "Constant should be properly set")
    }
    func testInt16Conversion() {
        let constant: Int16 = -5
        let predicate = <=constant
        XCTAssertEqual(predicate.constant, -5, "Constant should be properly set")
    }
    func testUInt16Conversion() {
        let constant: UInt16 = 6
        let predicate = >=constant
        XCTAssertEqual(predicate.constant, 6, "Constant should be properly set")
    }
    func testInt32Conversion() {
        let constant: Int32 = -7
        let predicate = ==constant
        XCTAssertEqual(predicate.constant, -7, "Constant should be properly set")
    }
    func testUInt32Conversion() {
        let constant: UInt32 = 8
        let predicate = <=constant
        XCTAssertEqual(predicate.constant, 8, "Constant should be properly set")
    }
    func testInt64Conversion() {
        let constant: Int64 = -9
        let predicate = >=constant
        XCTAssertEqual(predicate.constant, -9, "Constant should be properly set")
    }
    func testUInt64Conversion() {
        let constant: UInt64 = 10
        let predicate = ==constant
        XCTAssertEqual(predicate.constant, 10, "Constant should be properly set")
    }
    func testFloatConversion() {
        let constant: Float = -11
        let predicate = <=constant
        XCTAssertEqual(predicate.constant, -11, "Constant should be properly set")
    }
    func testDoubleConversion() {
        let constant: Double = -12
        let predicate = >=constant
        XCTAssertEqual(predicate.constant, -12, "Constant should be properly set")
    }

}
