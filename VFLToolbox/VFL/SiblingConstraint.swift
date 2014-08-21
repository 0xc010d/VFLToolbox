import UIKit

enum SiblingAttribute {
    case Leading
    case Trailing

    private func NSLayoutAttributeRepresentation(direction: Direction) -> NSLayoutAttribute {
        switch (self, direction) {
        case (.Leading, .Horizontal):
            return .Leading
        case (.Leading, .Vertical):
            return .Top
        case (.Trailing, .Horizontal):
            return .Trailing
        case (.Trailing, .Vertical):
            return .Bottom
        }
    }
}

public class SiblingConstraint : VFLConstraint {
    let predicate: Predicate
    let sourceAttribute: SiblingAttribute = .Trailing
    let targetAttribute: SiblingAttribute = .Leading
    init(sibling: Sibling, item: AnyObject) {
        predicate = sibling.predicate
        super.init(target: item, source: sibling.item)
    }

    override public func UIKitRepresentation(_ direction: Direction = .Horizontal) -> NSLayoutConstraint! {
        return NSLayoutConstraint(
            item: target,
            attribute: targetAttribute.NSLayoutAttributeRepresentation(direction),
            relatedBy: predicate.relation,
            toItem: source,
            attribute: sourceAttribute.NSLayoutAttributeRepresentation(direction),
            multiplier: 1,
            constant: predicate.constant
        )
    }

}
