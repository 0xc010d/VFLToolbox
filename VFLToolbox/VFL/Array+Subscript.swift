import UIKit

public extension Array {

    public subscript(target: UIView) -> [VFLConstraint] {
        if isEmpty {
            return []
        }

        switch Element.self {
        case is UIView.Type:
            let sibling = Sibling(view: last as UIView)
            let constraint = SiblingConstraint(sibling: sibling, view: target)
            return [constraint]

        case is VFLConstraint.Type:
            //NOTE: This is the reason we don't declare VFLConstraint as a protocol
            var result: [VFLConstraint] = self.map({ return $0 as VFLConstraint })
            let sibling = Sibling(view: (last as VFLConstraint).target)
            let constraint = SiblingConstraint(sibling: sibling, view: target)
            result.append(constraint)
            return result

        default:
            assert(false, "Should not reach here")
            return []
        }
    }

}
