import UIKit

extension NSLayoutConstraint {

    public class func constraintsWithVisualFormat(#H: [VFLConstraint]) -> [NSLayoutConstraint] {
        return H.map({ return $0.UIKitRepresentation(.Horizontal) })
    }
    public class func constraintsWithVisualFormat(#V: [VFLConstraint]) -> [NSLayoutConstraint] {
        return V.map({ return $0.UIKitRepresentation(.Vertical) })
    }

}
