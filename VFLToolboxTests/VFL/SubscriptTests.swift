import UIKit
import XCTest
import VFLToolbox

class SubscriptTests: XCTestCase {
    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()
    let superview = UIView()
    var views: Dictionary<String, UIView> = [:]
    override func setUp() {
        superview.addSubview(view1)
        superview.addSubview(view2)
        superview.addSubview(view3)
        views["view1"] = view1
        views["view2"] = view2
        views["view3"] = view3
    }

    func testTwoHorizontalViewsSubscript() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(H:[view1][view2])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("H:[view1][view2]", options: nil, metrics: nil, views: views)
        AssertConstraintsEqual(constraints, check)
    }

    func testThreeHorizontalViewsSubscript() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(H:[view1][view2][view3])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("H:[view1][view2][view3]", options: nil, metrics: nil, views: views)
        AssertConstraintsEqual(constraints, check)
    }

    func testTwoVerticalViewsSubscript() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:[view1][view2])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:[view1][view2]", options: nil, metrics: nil, views: views)
        AssertConstraintsEqual(constraints, check)
    }

    func testThreeVerticalViewsSubscript() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:[view1][view2][view3])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:[view1][view2][view3]", options: nil, metrics: nil, views: views)
        AssertConstraintsEqual(constraints, check)
    }
    
}
