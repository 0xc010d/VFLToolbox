import UIKit

enum SuperviewMode {
    case Head
    case Tail

    private func NSLayoutAttributeRepresentation(direction: Direction) -> NSLayoutAttribute {
        switch (self, direction) {
        case (.Head, .Horizontal):
            return .Leading
        case (.Head, .Vertical):
            return .Top
        case (.Tail, .Horizontal):
            return .Trailing
        case (.Tail, .Vertical):
            return .Bottom
        }
    }
}

public class SuperviewConstraint: VFLConstraint {
    let mode: SuperviewMode
    let predicate: Predicate
    init(superview: Superview, view: UIView) {
        self.mode = superview.mode
        predicate = superview.predicate
        var target: UIView!, source: UIView!
        switch mode {
        case .Head:
            target = view
            source = view.superview
        case .Tail:
            target = view.superview
            source = view
        }
        super.init(target: target, source: source)
    }

    override public func UIKitRepresentation(_ direction: Direction = .Horizontal) -> NSLayoutConstraint! {
        let attribute = mode.NSLayoutAttributeRepresentation(direction)
        return NSLayoutConstraint(
            item: target,
            attribute: attribute,
            relatedBy: predicate.relation,
            toItem: source,
            attribute: attribute,
            multiplier: 1,
            constant: predicate.constant
        )
    }
}
