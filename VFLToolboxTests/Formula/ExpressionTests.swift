import UIKit
import XCTest
import VFLToolbox

class ExpressionTests: XCTestCase {

    func testAttributePlusConstant() {
        let view = UIView()
        let expression = view.left + 42
        XCTAssertEqual(expression.constant, 42, "Constant should be properly set")
        XCTAssertEqual(expression.multiplier, 1, "Multiplier should be properly set")
        XCTAssertNotNil(expression.source, "Source should not be nil")
        XCTAssertEqual(expression.source!.view, view, "Source view should not be properly set")
        XCTAssertEqual(expression.source!.attribute, NSLayoutAttribute.Left, "Source attribute should not be properly set")
    }

    func testConstantPlusAttribute() {
        let view = UIView()
        let expression = 41 + view.right
        XCTAssertEqual(expression.constant, 41, "Constant should be properly set")
        XCTAssertEqual(expression.multiplier, 1, "Multiplier should be properly set")
        XCTAssertNotNil(expression.source, "Source should not be nil")
        XCTAssertEqual(expression.source!.view, view, "Source view should not be properly set")
        XCTAssertEqual(expression.source!.attribute, NSLayoutAttribute.Right, "Source attribute should not be properly set")
    }

    func testExpressionPlusConstant() {
        let view = UIView()
        let expression = view.bottom + 39 + 38
        XCTAssertEqual(expression.constant, 77, "Constant should be properly set")
        XCTAssertEqual(expression.multiplier, 1, "Multiplier should be properly set")
        XCTAssertNotNil(expression.source, "Source should not be nil")
        XCTAssertEqual(expression.source!.view, view, "Source view should not be properly set")
        XCTAssertEqual(expression.source!.attribute, NSLayoutAttribute.Bottom, "Source attribute should not be properly set")
    }
    
    func testConstantPlusExpression() {
        let view = UIView()
        let expression = 37 + view.bottom * 36
        XCTAssertEqual(expression.constant, 37, "Constant should be properly set")
        XCTAssertEqual(expression.multiplier, 36, "Multiplier should be properly set")
        XCTAssertNotNil(expression.source, "Source should not be nil")
        XCTAssertEqual(expression.source!.view, view, "Source view should not be properly set")
        XCTAssertEqual(expression.source!.attribute, NSLayoutAttribute.Bottom, "Source attribute should not be properly set")
    }

    func testAttributeMinusConstant() {
        let view = UIView()
        let expression = view.top - 40
        XCTAssertEqual(expression.constant, -40, "Constant should be properly set")
        XCTAssertEqual(expression.multiplier, 1, "Multiplier should be properly set")
        XCTAssertNotNil(expression.source, "Source should not be nil")
        XCTAssertEqual(expression.source!.view, view, "Source view should not be properly set")
        XCTAssertEqual(expression.source!.attribute, NSLayoutAttribute.Top, "Source attribute should not be properly set")
    }

    func testExpressionMinusConstant() {
        let view = UIView()
        let expression = view.leading + 37 - 36
        XCTAssertEqual(expression.constant, 1, "Constant should be properly set")
        XCTAssertEqual(expression.multiplier, 1, "Multiplier should be properly set")
        XCTAssertNotNil(expression.source, "Source should not be nil")
        XCTAssertEqual(expression.source!.view, view, "Source view should not be properly set")
        XCTAssertEqual(expression.source!.attribute, NSLayoutAttribute.Leading, "Source attribute should not be properly set")
    }

    func testAttributeMultipliedByConstant() {
        let view = UIView()
        let expression = view.trailing * 35
        XCTAssertEqual(expression.constant, 0, "Constant should be properly set")
        XCTAssertEqual(expression.multiplier, 35, "Multiplier should be properly set")
        XCTAssertNotNil(expression.source, "Source should not be nil")
        XCTAssertEqual(expression.source!.view, view, "Source view should not be properly set")
        XCTAssertEqual(expression.source!.attribute, NSLayoutAttribute.Trailing, "Source attribute should not be properly set")
    }

    func testConstantMultipliedByAttribute() {
        let view = UIView()
        let expression = 34 * view.width
        XCTAssertEqual(expression.constant, 0, "Constant should be properly set")
        XCTAssertEqual(expression.multiplier, 34, "Multiplier should be properly set")
        XCTAssertNotNil(expression.source, "Source should not be nil")
        XCTAssertEqual(expression.source!.view, view, "Source view should not be properly set")
        XCTAssertEqual(expression.source!.attribute, NSLayoutAttribute.Width, "Source attribute should not be properly set")
    }
    
    func testExpressionMultipliedByConstant() {
        let view = UIView()
        let expression = view.trailing * 35 * 34
        XCTAssertEqual(expression.constant, 0, "Constant should be properly set")
        XCTAssertEqual(expression.multiplier, 1190, "Multiplier should be properly set")
        XCTAssertNotNil(expression.source, "Source should not be nil")
        XCTAssertEqual(expression.source!.view, view, "Source view should not be properly set")
        XCTAssertEqual(expression.source!.attribute, NSLayoutAttribute.Trailing, "Source attribute should not be properly set")
    }
    
    func testConstantMultipliedByExpression() {
        let view = UIView()
        let expression = 34 * view.width * 33
        XCTAssertEqual(expression.constant, 0, "Constant should be properly set")
        XCTAssertEqual(expression.multiplier, 1122, "Multiplier should be properly set")
        XCTAssertNotNil(expression.source, "Source should not be nil")
        XCTAssertEqual(expression.source!.view, view, "Source view should not be properly set")
        XCTAssertEqual(expression.source!.attribute, NSLayoutAttribute.Width, "Source attribute should not be properly set")
    }
    
    func testAttributeDevidedByConstant() {
        let view = UIView()
        let expression = view.height / 20
        XCTAssertEqual(expression.constant, 0, "Constant should be properly set")
        XCTAssertEqual(expression.multiplier, 0.05, "Multiplier should be properly set")
        XCTAssertNotNil(expression.source, "Source should not be nil")
        XCTAssertEqual(expression.source!.view, view, "Source view should not be properly set")
        XCTAssertEqual(expression.source!.attribute, NSLayoutAttribute.Height, "Source attribute should not be properly set")
    }

    func testExpressionDividedByConstant() {
        let view = UIView()
        let expression = view.centerX * 7 / 8
        XCTAssertEqual(expression.constant, 0, "Constant should be properly set")
        XCTAssertEqual(expression.multiplier, 0.875, "Multiplier should be properly set")
        XCTAssertNotNil(expression.source, "Source should not be nil")
        XCTAssertEqual(expression.source!.view, view, "Source view should not be properly set")
        XCTAssertEqual(expression.source!.attribute, NSLayoutAttribute.CenterX, "Source attribute should not be properly set")
    }

    // Complex expression makes compiler crazy and it's unclear how it would affect runtime so avoid such a usage
    func testComplexExpression() {
        let view = UIView()
        let expression = 1 + 2 * view.centerY * 3 / 4 - 5
        XCTAssertEqual(expression.constant, -4, "Constant should be properly set")
        XCTAssertEqual(expression.multiplier, 1.5, "Multiplier should be properly set")
        XCTAssertNotNil(expression.source, "Source should not be nil")
        XCTAssertEqual(expression.source!.view, view, "Source view should not be properly set")
        XCTAssertEqual(expression.source!.attribute, NSLayoutAttribute.CenterY, "Source attribute should not be properly set")
    }
    
    func testIntConversion() {
        let view = UIView(), constant: Int = -1
        let expression = view.top + constant
        XCTAssertEqual(expression.constant, -1, "Constant should be properly set")
    }
    func testUIntConversion() {
        let view = UIView(), constant: UInt = 2
        let expression = view.left + constant
        XCTAssertEqual(expression.constant, 2, "Constant should be properly set")
    }
    func testInt8Conversion() {
        let view = UIView(), constant: Int8 = -3
        let expression = view.bottom + constant
        XCTAssertEqual(expression.constant, -3, "Constant should be properly set")
    }
    func testUInt8Conversion() {
        let view = UIView(), constant: UInt8 = 4
        let expression = view.right + constant
        XCTAssertEqual(expression.constant, 4, "Constant should be properly set")
    }
    func testInt16Conversion() {
        let view = UIView(), constant: Int16 = -5
        let expression = view.width + constant
        XCTAssertEqual(expression.constant, -5, "Constant should be properly set")
    }
    func testUInt16Conversion() {
        let view = UIView(), constant: UInt16 = 6
        let expression = view.height + constant
        XCTAssertEqual(expression.constant, 6, "Constant should be properly set")
    }
    func testInt32Conversion() {
        let view = UIView(), constant: Int32 = -7
        let expression = view.leading + constant
        XCTAssertEqual(expression.constant, -7, "Constant should be properly set")
    }
    func testUInt32Conversion() {
        let view = UIView(), constant: UInt32 = 8
        let expression = view.trailing + constant
        XCTAssertEqual(expression.constant, 8, "Constant should be properly set")
    }
    func testInt64Conversion() {
        let view = UIView(), constant: Int64 = -9
        let expression = view.centerX + constant
        XCTAssertEqual(expression.constant, -9, "Constant should be properly set")
    }
    func testUInt64Conversion() {
        let view = UIView(), constant: UInt64 = 10
        let expression = view.centerY + constant
        XCTAssertEqual(expression.constant, 10, "Constant should be properly set")
    }
    func testFloatConversion() {
        let view = UIView(), constant: Float = -11
        let expression = view.baseline + constant
        XCTAssertEqual(expression.constant, -11, "Constant should be properly set")
    }
    func testDoubleConversion() {
        let view = UIView(), constant: Double = -12
        let expression = view.top + constant
        XCTAssertEqual(expression.constant, -12, "Constant should be properly set")
    }

}
