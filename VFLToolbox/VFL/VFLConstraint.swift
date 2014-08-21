import UIKit

//TODO: make a protocol of it
public class VFLConstraint {

    let target: AnyObject
    let source: AnyObject
    public func UIKitRepresentation(direction: Direction) -> NSLayoutConstraint! {
        return nil
    }
    init(target: AnyObject, source: AnyObject) {
        self.target = target
        self.source = source
    }

}
