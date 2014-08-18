import UIKit
import XCTest
import VFLToolbox

class SuperviewTests: XCTestCase {
    let view1 = UIView()
    let view2 = UIView()
    var views: Dictionary<String, UIView> = [:]
    let superview = UIView()
    override func setUp() {
        superview.addSubview(view1)
        superview.addSubview(view2)
        views["view1"] = view1
        views["view2"] = view2
    }

    func testHorizontalLeadingSuperview() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(H:|[view1])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("H:|[view1]", options: nil, metrics: nil, views: views)
        AssertConstraintsEqual(constraints, check)
    }
    
    func testVerticalTopSuperview() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:|[view1])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:|[view1]", options: nil, metrics: nil, views: views)
        AssertConstraintsEqual(constraints, check)
    }
    
    func testHorizontalLeadingSuperviewWithConstraintList() {
        let margin = 10
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(H:|[view1][view2])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("H:|[view1][view2]", options: nil, metrics: ["margin" : margin], views: views)
        AssertConstraintsEqual(constraints, check)
    }
    
    func testVerticalTopSuperviewWithConstraintList() {
        let margin = 0
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:|[view1][view2])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:|[view1][view2]", options: nil, metrics: ["margin" : margin], views: views)
        AssertConstraintsEqual(constraints, check)
    }
    
    func testHorizontalLeadingPredicatedSuperview() {
        let margin = 10
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(H:|-(<=margin)-[view1])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(<=margin)-[view1]", options: nil, metrics: ["margin" : margin], views: views)
        AssertConstraintsEqual(constraints, check)
    }
    
    func testVerticalTopPredicatedSuperview() {
        let margin = 0
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:|-(>=margin)-[view1])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:|-(>=margin)-[view1]", options: nil, metrics: ["margin" : margin], views: views)
        AssertConstraintsEqual(constraints, check)
    }

    func testHorizontalLeadingPredicatedSuperviewWithConstraintList() {
        let margin = 10
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(H:|-(<=margin)-[view1][view2])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(<=margin)-[view1][view2]", options: nil, metrics: ["margin" : margin], views: views)
        AssertConstraintsEqual(constraints, check)
    }
    
    func testVerticalTopPredicatedSuperviewWithConstraintList() {
        let margin = 0
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:|-(>=margin)-[view1][view2])
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:|-(>=margin)-[view1][view2]", options: nil, metrics: ["margin" : margin], views: views)
        AssertConstraintsEqual(constraints, check)
    }
    
    func testHorizontalTrailingSuperview() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(H:[view1]|)
        let check = NSLayoutConstraint.constraintsWithVisualFormat("H:[view1]|", options: nil, metrics: nil, views: views)
        AssertConstraintsEqual(constraints, check)
    }
    
    func testVerticalBottomSuperview() {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:[view1]|)
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:[view1]|", options: nil, metrics: nil, views: views)
        AssertConstraintsEqual(constraints, check)
    }
    
    func testHorizontalTrailingSuperviewWithConstraintList() {
        let margin = 10
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(H:[view1][view2]|)
        let check = NSLayoutConstraint.constraintsWithVisualFormat("H:[view1][view2]|", options: nil, metrics: ["margin" : margin], views: views)
        AssertConstraintsEqual(constraints, check)
    }
    
    func testVerticalBottomSuperviewWithConstraintList() {
        let margin = 0
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:[view1][view2]|)
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:[view1][view2]|", options: nil, metrics: ["margin" : margin], views: views)
        AssertConstraintsEqual(constraints, check)
    }
    
    func testHorizontalTrailingPredicatedSuperview() {
        let margin = 10
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(H:[view1]-(<=margin)-|)
        let check = NSLayoutConstraint.constraintsWithVisualFormat("H:[view1]-(<=margin)-|", options: nil, metrics: ["margin" : margin], views: views)
        AssertConstraintsEqual(constraints, check)
    }
    
    func testVerticalBottomPredicatedSuperview() {
        let margin = 0
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:[view1]-(>=margin)-|)
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:[view1]-(>=margin)-|", options: nil, metrics: ["margin" : margin], views: views)
        AssertConstraintsEqual(constraints, check)
    }
    
    func testHorizontalTrailingPredicatedSuperviewWithConstraintList() {
        let margin = 10
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(H:[view1][view2]-(<=margin)-|)
        let check = NSLayoutConstraint.constraintsWithVisualFormat("H:[view1][view2]-(<=margin)-|", options: nil, metrics: ["margin" : margin], views: views)
        AssertConstraintsEqual(constraints, check)
    }
    
    func testVerticalBottomPredicatedSuperviewWithConstraintList() {
        let margin = 0
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V:[view1][view2]-(>=margin)-|)
        let check = NSLayoutConstraint.constraintsWithVisualFormat("V:[view1][view2]-(>=margin)-|", options: nil, metrics: ["margin" : margin], views: views)
        AssertConstraintsEqual(constraints, check)
    }

}
