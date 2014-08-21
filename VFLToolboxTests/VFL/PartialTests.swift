import UIKit
import XCTest
import VFLToolbox

class PartialTests: XCTestCase {

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
    
    func testHorizontalConstraintListWithPredicatedView() {
        let constant = -5
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(H:[view1][view2]-constant-[view3])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("H:[view1][view2]-constant-[view3]", options: nil, metrics: ["constant" : constant], views: views)
        AssertConstraintsEqual(constraints, check)
    }
    
    func testVerticalConstraintListWithPredicatedView() {
        let constant: Double = 12
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:[view1][view2]-(>=constant)-[view3])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:[view1][view2]-(>=constant)-[view3]", options: nil, metrics: ["constant" : constant], views: views)
        AssertConstraintsEqual(constraints, check)
    }
    
    func testHorizontalConstraintListWithPredicatedConstraintList() {
        let constant = 0
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(H:[view1][view2]-(==constant)-[view3][view4])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("H:[view1][view2]-(==constant)-[view3][view4]", options: nil, metrics: ["constant" : constant], views: views)
        AssertConstraintsEqual(constraints, check)
    }
    
    func testVerticalConstraintListWithPredicatedConstraintList() {
        let constant: Float = 33
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:[view1][view2]-(<=constant)-[view3][view4])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:[view1][view2]-(<=constant)-[view3][view4]", options: nil, metrics: ["constant" : constant], views: views)
        AssertConstraintsEqual(constraints, check)
    }
    
    func testHorizontalLeadingSuperviewConstraintWithPredicatedSibling() {
        let constant = 0
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(H:|[view1]-(==constant)-[view2])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("H:|[view1]-(==constant)-[view2]", options: nil, metrics: ["constant" : constant], views: views)
        AssertConstraintsEqual(constraints, check)
    }
    
    func testVerticalLeadingSuperviewConstraintWithPredicatedSibling() {
        let constant: UInt = 3
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:|[view1]-(<=constant)-[view2])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:|[view1]-(<=constant)-[view2]", options: nil, metrics: ["constant" : constant], views: views)
        AssertConstraintsEqual(constraints, check)
    }
    
    func testHorizontalLeadingSuperviewConstraintWithPredicatedConstraintList() {
        let constant = 0
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(H:|[view1]-(>=constant)-[view2][view3])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("H:|[view1]-(>=constant)-[view2][view3]", options: nil, metrics: ["constant" : constant], views: views)
        AssertConstraintsEqual(constraints, check)
    }

    func testVerticalLeadingSuperviewConstraintWithPredicatedConstraintList() {
        let constant: Float = 33
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:|[view1]-constant-[view2][view3])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:|[view1]-constant-[view2][view3]", options: nil, metrics: ["constant" : constant], views: views)
        AssertConstraintsEqual(constraints, check)
    }

}
