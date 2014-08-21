import UIKit

public extension Array {

    public subscript(target: UILayoutSupport) -> [VFLConstraint] {
        return get(target)
    }

    public subscript(target: UIView) -> [VFLConstraint] {
        return get(target)
    }

    private func get(target: AnyObject) -> [VFLConstraint] {
        if isEmpty || count > 1 {
            assert(false, "Should not reach here")
            return []
        }

        switch self[0] {
        case let view as UIView:
            let sibling = Sibling(item: view)
            let constraint = SiblingConstraint(sibling: sibling, item: target)
            return [constraint]

        case let constraint as VFLConstraint:
            //NOTE: This is the reason we don't declare VFLConstraint as a protocol
            var result: [VFLConstraint] = self.map({ return $0 as VFLConstraint })
            let sibling = Sibling(item: constraint.target)
            let siblingConstraint = SiblingConstraint(sibling: sibling, item: target)
            result.append(siblingConstraint)
            return result

        //This one is questionable, unfortunately we can't cast to UILayoutSupport as it's not @objc protocol
        case let guide as NSObject:
            var result: [VFLConstraint] = self.map({ return $0 as VFLConstraint })
            let sibling = Sibling(item: guide)
            let constraint = SiblingConstraint(sibling: sibling, item: target)
            result.append(constraint)
            return result

        default:
            assert(false, "Should not reach here")
            return []

        }
    }

}
