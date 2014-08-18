import UIKit

//TODO: make a protocol of it
public class VFLConstraint {
    let target: UIView
    let source: UIView
    public func UIKitRepresentation(direction: Direction) -> NSLayoutConstraint! {
        return nil
    }
    init(target: UIView, source: UIView) {
        self.target = target
        self.source = source
    }
}
