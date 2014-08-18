import UIKit
import XCTest
import VFLToolbox

class AttributeTests: XCTestCase {

    func testLeft() {
        let view = UIView()
        let attribute = view.left
        XCTAssertEqual(attribute.view, view, "View should be properly set")
        XCTAssertEqual(attribute.attribute, NSLayoutAttribute.Left, "Attribute should be properly set")
    }

    func testRight() {
        let view = UIView()
        let attribute = view.right
        XCTAssertEqual(attribute.view, view, "View should be properly set")
        XCTAssertEqual(attribute.attribute, NSLayoutAttribute.Right, "Attribute should be properly set")
    }

    func testTop() {
        let view = UIView()
        let attribute = view.top
        XCTAssertEqual(attribute.view, view, "View should be properly set")
        XCTAssertEqual(attribute.attribute, NSLayoutAttribute.Top, "Attribute should be properly set")
    }

    func testBottom() {
        let view = UIView()
        let attribute = view.bottom
        XCTAssertEqual(attribute.view, view, "View should be properly set")
        XCTAssertEqual(attribute.attribute, NSLayoutAttribute.Bottom, "Attribute should be properly set")
    }

    func testLeading() {
        let view = UIView()
        let attribute = view.leading
        XCTAssertEqual(attribute.view, view, "View should be properly set")
        XCTAssertEqual(attribute.attribute, NSLayoutAttribute.Leading, "Attribute should be properly set")
    }

    func testTrailing() {
        let view = UIView()
        let attribute = view.trailing
        XCTAssertEqual(attribute.view, view, "View should be properly set")
        XCTAssertEqual(attribute.attribute, NSLayoutAttribute.Trailing, "Attribute should be properly set")
    }

    func testWidth() {
        let view = UIView()
        let attribute = view.width
        XCTAssertEqual(attribute.view, view, "View should be properly set")
        XCTAssertEqual(attribute.attribute, NSLayoutAttribute.Width, "Attribute should be properly set")
    }

    func testHeight() {
        let view = UIView()
        let attribute = view.height
        XCTAssertEqual(attribute.view, view, "View should be properly set")
        XCTAssertEqual(attribute.attribute, NSLayoutAttribute.Height, "Attribute should be properly set")
    }

    func testCenterX() {
        let view = UIView()
        let attribute = view.centerX
        XCTAssertEqual(attribute.view, view, "View should be properly set")
        XCTAssertEqual(attribute.attribute, NSLayoutAttribute.CenterX, "Attribute should be properly set")
    }

    func testCenterY() {
        let view = UIView()
        let attribute = view.centerY
        XCTAssertEqual(attribute.view, view, "View should be properly set")
        XCTAssertEqual(attribute.attribute, NSLayoutAttribute.CenterY, "Attribute should be properly set")
    }
    
    func testBaseline() {
        let view = UIView()
        let attribute = view.baseline
        XCTAssertEqual(attribute.view, view, "View should be properly set")
        XCTAssertEqual(attribute.attribute, NSLayoutAttribute.Baseline, "Attribute should be properly set")
    }

}
