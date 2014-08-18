import UIKit
import XCTest
import VFLToolbox

class ConstraintTests: XCTestCase {

    func testEqualConstraintWithConstant() {
        let view1 = UIView()
        let constraint = view1.width == 16
        XCTAssertNotNil(constraint.firstItem, "First item should not be nil")
        XCTAssertEqual(constraint.firstItem as UIView, view1, "First item should be properly set")
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width, "First attribute should be properly set")
        XCTAssertNil(constraint.secondItem, "Second item should be nil")
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.NotAnAttribute, "Second item should be properly set")
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal, "Relation should be properly set")
        XCTAssertEqual(constraint.multiplier, 1, "Multiplier should be properly set")
        XCTAssertEqual(constraint.constant, 16, "Constant should be properly set")
    }

    func testEqualConstraintWithAttribute() {
        let view1 = UIView()
        let constraint = view1.width == view1.height
        XCTAssertNotNil(constraint.firstItem, "First item should not be nil")
        XCTAssertEqual(constraint.firstItem as UIView, view1, "First item should be properly set")
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width, "First attribute should be properly set")
        XCTAssertNotNil(constraint.secondItem, "Second item should not be nil")
        XCTAssertEqual(constraint.secondItem as UIView, view1, "Second item should be properly set")
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Height, "Second item should be properly set")
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal, "Relation should be properly set")
        XCTAssertEqual(constraint.multiplier, 1, "Multiplier should be properly set")
        XCTAssertEqual(constraint.constant, 0, "Constant should be properly set")
    }
    
    func testEqualConstraintWithExpression() {
        let view1 = UIView(), view2 = UIView()
        let constraint = view1.top == view2.bottom * 2 + 1
        XCTAssertNotNil(constraint.firstItem, "First item should not be nil")
        XCTAssertEqual(constraint.firstItem as UIView, view1, "First item should be properly set")
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Top, "First attribute should be properly set")
        XCTAssertNotNil(constraint.secondItem, "Second item should not be nil")
        XCTAssertEqual(constraint.secondItem as UIView, view2, "Second item should be properly set")
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Bottom, "Second item should be properly set")
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal, "Relation should be properly set")
        XCTAssertEqual(constraint.multiplier, 2, "Multiplier should be properly set")
        XCTAssertEqual(constraint.constant, 1, "Constant should be properly set")
    }
    
    func testLessThanOrEqualConstraintWithConstant() {
        let view1 = UIView()
        let constraint = view1.height <= 24
        XCTAssertNotNil(constraint.firstItem, "First item should not be nil")
        XCTAssertEqual(constraint.firstItem as UIView, view1, "First item should be properly set")
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Height, "First attribute should be properly set")
        XCTAssertNil(constraint.secondItem, "Second item should be nil")
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.NotAnAttribute, "Second item should be properly set")
        XCTAssertEqual(constraint.relation, NSLayoutRelation.LessThanOrEqual, "Relation should be properly set")
        XCTAssertEqual(constraint.multiplier, 1, "Multiplier should be properly set")
        XCTAssertEqual(constraint.constant, 24, "Constant should be properly set")
    }
    
    func testLessThanOrEqualConstraintWithAttribute() {
        let view1 = UIView()
        let constraint = view1.top <= view1.top
        XCTAssertNotNil(constraint.firstItem, "First item should not be nil")
        XCTAssertEqual(constraint.firstItem as UIView, view1, "First item should be properly set")
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Top, "First attribute should be properly set")
        XCTAssertNotNil(constraint.secondItem, "Second item should not be nil")
        XCTAssertEqual(constraint.secondItem as UIView, view1, "Second item should be properly set")
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Top, "Second item should be properly set")
        XCTAssertEqual(constraint.relation, NSLayoutRelation.LessThanOrEqual, "Relation should be properly set")
        XCTAssertEqual(constraint.multiplier, 1, "Multiplier should be properly set")
        XCTAssertEqual(constraint.constant, 0, "Constant should be properly set")
    }
    
    func testLessThanOrEqualConstraintWithExpression() {
        let view1 = UIView(), view2 = UIView()
        let constraint = view1.leading <= view2.leading - 1
        XCTAssertNotNil(constraint.firstItem, "First item should not be nil")
        XCTAssertEqual(constraint.firstItem as UIView, view1, "First item should be properly set")
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Leading, "First attribute should be properly set")
        XCTAssertNotNil(constraint.secondItem, "Second item should not be nil")
        XCTAssertEqual(constraint.secondItem as UIView, view2, "Second item should be properly set")
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Leading, "Second item should be properly set")
        XCTAssertEqual(constraint.relation, NSLayoutRelation.LessThanOrEqual, "Relation should be properly set")
        XCTAssertEqual(constraint.multiplier, 1, "Multiplier should be properly set")
        XCTAssertEqual(constraint.constant, -1, "Constant should be properly set")
    }
    
    func testGreaterThanOrEqualConstraintWithConstant() {
        let view1 = UIView()
        let constraint = view1.height >= 24
        XCTAssertNotNil(constraint.firstItem, "First item should not be nil")
        XCTAssertEqual(constraint.firstItem as UIView, view1, "First item should be properly set")
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Height, "First attribute should be properly set")
        XCTAssertNil(constraint.secondItem, "Second item should be nil")
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.NotAnAttribute, "Second item should be properly set")
        XCTAssertEqual(constraint.relation, NSLayoutRelation.GreaterThanOrEqual, "Relation should be properly set")
        XCTAssertEqual(constraint.multiplier, 1, "Multiplier should be properly set")
        XCTAssertEqual(constraint.constant, 24, "Constant should be properly set")
    }
    
    func testGreaterThanOrEqualConstraintWithAttribute() {
        let view1 = UIView(), view2 = UIView()
        let constraint = view2.bottom >= view1.bottom
        XCTAssertNotNil(constraint.firstItem, "First item should not be nil")
        XCTAssertEqual(constraint.firstItem as UIView, view2, "First item should be properly set")
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Bottom, "First attribute should be properly set")
        XCTAssertNotNil(constraint.secondItem, "Second item should not be nil")
        XCTAssertEqual(constraint.secondItem as UIView, view1, "Second item should be properly set")
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Bottom, "Second item should be properly set")
        XCTAssertEqual(constraint.relation, NSLayoutRelation.GreaterThanOrEqual, "Relation should be properly set")
        XCTAssertEqual(constraint.multiplier, 1, "Multiplier should be properly set")
        XCTAssertEqual(constraint.constant, 0, "Constant should be properly set")
    }
    
    func testGreaterThanOrEqualConstraintWithExpression() {
        let view1 = UIView(), view2 = UIView()
        let constraint = view2.trailing >= view1.trailing * 3 / 2 + 17
        XCTAssertNotNil(constraint.firstItem, "First item should not be nil")
        XCTAssertEqual(constraint.firstItem as UIView, view2, "First item should be properly set")
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Trailing, "First attribute should be properly set")
        XCTAssertNotNil(constraint.secondItem, "Second item should not be nil")
        XCTAssertEqual(constraint.secondItem as UIView, view1, "Second item should be properly set")
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Trailing, "Second item should be properly set")
        XCTAssertEqual(constraint.relation, NSLayoutRelation.GreaterThanOrEqual, "Relation should be properly set")
        XCTAssertEqual(constraint.multiplier, 1.5, "Multiplier should be properly set")
        XCTAssertEqual(constraint.constant, 17, "Constant should be properly set")
    }
    
    func testIntConversion() {
        let view = UIView(), constant: Int = -1
        let constraint = (view.width == constant)
        XCTAssertEqual(constraint.constant, -1, "Constant should be properly set")
    }
    func testUIntConversion() {
        let view = UIView(), constant: UInt = 2
        let constraint = (view.width == constant)
        XCTAssertEqual(constraint.constant, 2, "Constant should be properly set")
    }
    func testInt8Conversion() {
        let view = UIView(), constant: Int8 = -3
        let constraint = (view.width == constant)
        XCTAssertEqual(constraint.constant, -3, "Constant should be properly set")
    }
    func testUInt8Conversion() {
        let view = UIView(), constant: UInt8 = 4
        let constraint = (view.width == constant)
        XCTAssertEqual(constraint.constant, 4, "Constant should be properly set")
    }
    func testInt16Conversion() {
        let view = UIView(), constant: Int16 = -5
        let constraint = (view.width == constant)
        XCTAssertEqual(constraint.constant, -5, "Constant should be properly set")
    }
    func testUInt16Conversion() {
        let view = UIView(), constant: UInt16 = 6
        let constraint = (view.width == constant)
        XCTAssertEqual(constraint.constant, 6, "Constant should be properly set")
    }
    func testInt32Conversion() {
        let view = UIView(), constant: Int32 = -7
        let constraint = (view.width == constant)
        XCTAssertEqual(constraint.constant, -7, "Constant should be properly set")
    }
    func testUInt32Conversion() {
        let view = UIView(), constant: UInt32 = 8
        let constraint = (view.width == constant)
        XCTAssertEqual(constraint.constant, 8, "Constant should be properly set")
    }
    func testInt64Conversion() {
        let view = UIView(), constant: Int64 = -9
        let constraint = (view.width == constant)
        XCTAssertEqual(constraint.constant, -9, "Constant should be properly set")
    }
    func testUInt64Conversion() {
        let view = UIView(), constant: UInt64 = 10
        let constraint = (view.width == constant)
        XCTAssertEqual(constraint.constant, 10, "Constant should be properly set")
    }
    func testFloatConversion() {
        let view = UIView(), constant: Float = -11
        let constraint = (view.width == constant)
        XCTAssertEqual(constraint.constant, -11, "Constant should be properly set")
    }
    func testDoubleConversion() {
        let view = UIView(), constant: Double = -12
        let constraint = (view.width == constant)
        XCTAssertEqual(constraint.constant, -12, "Constant should be properly set")
    }

}
