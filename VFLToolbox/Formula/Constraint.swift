import UIKit

public class Constraint {
    public let target: Attribute
    public let expression: Expression
    public let relation: NSLayoutRelation
    private init(target: Attribute, expression: Expression, relation: NSLayoutRelation) {
        self.target = target
        self.expression = expression
        self.relation = relation
    }
    private func UIKitRepresentation() -> NSLayoutConstraint {
        var sourceView = expression.source?.view
        var sourceAttribute = expression.source?.attribute ?? NSLayoutAttribute.NotAnAttribute
        return NSLayoutConstraint(
            item: target.view,
            attribute: target.attribute,
            relatedBy: relation,
            toItem: sourceView,
            attribute: sourceAttribute,
            multiplier: expression.multiplier,
            constant: expression.constant
        )
    }
}

/*
Generics are used to prevent compile-time error when, for example

    enum E {
        case A
    }
    let t = E.A
    if t == .A {}

The last line in this example will give an error "'E' is not convertible to 'Attribute'"
Replacing the check with the following will fix the issue, it's just in case you see it again

    if t == E.A {}
*/

public func ==<A: Attribute, C: Constraintable>(attribute: A, argument: C) -> NSLayoutConstraint {
    return Constraint(target: attribute, expression: ConstraintableMakeExpression(argument), relation: .Equal).UIKitRepresentation()
}

public func <=<A: Attribute, C: Constraintable>(attribute: A, argument: C) -> NSLayoutConstraint {
    return Constraint(target: attribute, expression: ConstraintableMakeExpression(argument), relation: .LessThanOrEqual).UIKitRepresentation()
}

public func >=<A: Attribute, C: Constraintable>(attribute: A, argument: C) -> NSLayoutConstraint {
    return Constraint(target: attribute, expression: ConstraintableMakeExpression(argument), relation: .GreaterThanOrEqual).UIKitRepresentation()
}
