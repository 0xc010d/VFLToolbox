import UIKit
import XCTest
import VFLToolbox

class SiblingTests: XCTestCase {
    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()
    let view4 = UIView()
    var views: [String : UIView] = [:]
    let superview = UIView()
    override func setUp() {
        superview.addSubview(view1)
        superview.addSubview(view2)
        superview.addSubview(view3)
        superview.addSubview(view4)
        views["view1"] = view1
        views["view2"] = view2
        views["view3"] = view3
        views["view4"] = view4
    }

    func testHorizontalPredicatedSiblings() {
        let constant = 10
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(H:[view1]-(>=constant)-[view2])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("H:[view1]-(>=constant)-[view2]", options: nil, metrics: ["constant" : constant], views: views)
        AssertConstraintsEqual(constraints, check)
    }

    func testVerticalPredicatedSiblings() {
        let constant = -3
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:[view1]-(<=constant)-[view2])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:[view1]-(<=constant)-[view2]", options: nil, metrics: ["constant" : constant], views: views)
        AssertConstraintsEqual(constraints, check)
    }

    func testHorizontalPredicatedSiblingsWithConstraintList() {
        let constant: Float = 10
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(H:[view1]-(>=constant)-[view2][view3])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("H:[view1]-(>=constant)-[view2][view3]", options: nil, metrics: ["constant" : constant], views: views)
        AssertConstraintsEqual(constraints, check)
    }

    func testVerticalPredicatedSiblingsWithConstraintList() {
        let constant = -M_PI
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:[view1]-(<=constant)-[view2][view3])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:[view1]-(<=constant)-[view2][view3]", options: nil, metrics: ["constant" : constant], views: views)
        AssertConstraintsEqual(constraints, check)
    }
    
}
