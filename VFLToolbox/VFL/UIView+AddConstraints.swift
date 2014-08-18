import UIKit

extension UIView {

    public func addConstraints(#H: [VFLConstraint]) {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(H: H)
        self.addConstraints(constraints)
    }
    public func addConstraints(#V: [VFLConstraint]) {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(V: V)
        self.addConstraints(constraints)
    }

}
