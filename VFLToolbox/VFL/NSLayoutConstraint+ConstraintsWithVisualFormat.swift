import UIKit

extension NSLayoutConstraint {

    public class func constraintsWithVisualFormat(#H: [VFLConstraint]) -> [NSLayoutConstraint] {
        return H.map({ return $0.UIKitRepresentation(.Horizontal) })
    }
    public class func constraintsWithVisualFormat(#V: [VFLConstraint]) -> [NSLayoutConstraint] {
        return V.map({ return $0.UIKitRepresentation(.Vertical) })
    }
    private class func constraintsWithVisualFormat(format: [VFLConstraint]) -> [NSLayoutConstraint] {
        let direction: Direction = format.filter({
            let usesViewsOnly = $0.target is UIView && $0.source is UIView
            return !usesViewsOnly
        }).count == 0 ? .Horizontal : .Vertical
        return format.map({ return $0.UIKitRepresentation(direction) })
    }

}
