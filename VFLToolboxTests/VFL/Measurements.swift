import UIKit
import XCTest
import VFLToolbox

class Measurements: XCTestCase {

    let view1 = UIView(),
        view2 = UIView(),
        view3 = UIView(),
        view4 = UIView(),
        view5 = UIView(),
        superview = UIView()
    let metric1 = 1,
        metric2 = 2,
        metric3 = 3,
        metric4 = 4
    var views: [String : UIView] = [:]
    var metrics: [String : Int] = [:]

    override func setUp() {
        superview.addSubview(view1)
        superview.addSubview(view2)
        superview.addSubview(view3)
        superview.addSubview(view4)
        superview.addSubview(view5)
        views["view1"] = view1
        views["view2"] = view2
        views["view3"] = view3
        views["view4"] = view4
        views["view5"] = view5
        metrics["metric1"] = metric1
        metrics["metric2"] = metric2
        metrics["metric3"] = metric3
        metrics["metric4"] = metric4
    }
    
    func test1000x5HorizontalConstraintsNoMetrics() {
        self.measureBlock() {
            for i in 1...1000 {
                let t = NSLayoutConstraint.constraintsWithVisualFormat(H:[self.view1][self.view2]-(==1)-[self.view3]-(<=2)-[self.view4]-(>=3)-[self.view5])
            }
        }
    }
    
    func test1000x5HorizontalVFLConstraintsNoMetrics() {
        self.measureBlock() {
            for i in 1...1000 {
                let t = NSLayoutConstraint.constraintsWithVisualFormat("H:[view1][view2]-(==1)-[view3]-(<=2)-[view4]-(>=3)-[view5]", options: nil, metrics: nil, views: self.views)
            }
        }
    }

    func test1000x5HorizontalConstraints() {
        self.measureBlock() {
            for i in 1...1000 {
                let t = NSLayoutConstraint.constraintsWithVisualFormat(H:[self.view1][self.view2]-(==self.metric2)-[self.view3]-(<=self.metric3)-[self.view4]-(>=self.metric4)-[self.view5])
            }
        }
    }
    
    func test1000x5HorizontalVFLConstraints() {
        self.measureBlock() {
            for i in 1...1000 {
                let t = NSLayoutConstraint.constraintsWithVisualFormat("H:[view1][view2]-(==metric2)-[view3]-(<=metric3)-[view4]-(>=metric4)-[view5]", options: nil, metrics: self.metrics, views: self.views)
            }
        }
    }
    
    func test1000x4HorizontalConstraints() {
        self.measureBlock() {
            for i in 1...1000 {
                let t = NSLayoutConstraint.constraintsWithVisualFormat(H:|[self.view1][self.view2]-(self.metric1)-[self.view3]-(self.metric2)-[self.view4])
            }
        }
    }
    
    func test1000x4HorizontalVFLConstraints() {
        self.measureBlock() {
            for i in 1...1000 {
                let t = NSLayoutConstraint.constraintsWithVisualFormat("H:|[view1][view2]-(metric1)-[view3]-(metric2)-[view4]", options: nil, metrics: self.metrics, views: self.views)
            }
        }
    }
    
    func test1000x3HorizontalConstraints() {
        self.measureBlock() {
            for i in 1...1000 {
                let t = NSLayoutConstraint.constraintsWithVisualFormat(H:|[self.view1][self.view2]-(self.metric1)-[self.view3])
            }
        }
    }
    
    func test1000x3HorizontalVFLConstraints() {
        self.measureBlock() {
            for i in 1...1000 {
                let t = NSLayoutConstraint.constraintsWithVisualFormat("H:|[view1][view2]-(metric1)-[view3]", options: nil, metrics: self.metrics, views: self.views)
            }
        }
    }
    
    func test1000x2HorizontalConstraints() {
        self.measureBlock() {
            for i in 1...1000 {
                let t = NSLayoutConstraint.constraintsWithVisualFormat(H:|[self.view1][self.view2])
            }
        }
    }
    
    func test1000x2HorizontalVFLConstraints() {
        self.measureBlock() {
            for i in 1...1000 {
                let t = NSLayoutConstraint.constraintsWithVisualFormat("H:|[view1][view2]", options: nil, metrics: nil, views: self.views)
            }
        }
    }

    func test1000xSuperviewHorizontalConstraints() {
        self.measureBlock() {
            for i in 1...1000 {
                let t = NSLayoutConstraint.constraintsWithVisualFormat(H:|[self.view1]|)
            }
        }
    }
    
    func test1000xSuperviewVFLConstraints() {
        self.measureBlock() {
            for i in 1...1000 {
                let t = NSLayoutConstraint.constraintsWithVisualFormat("H:|[view1]|", options: nil, metrics: nil, views: self.views)
            }
        }
    }

}
