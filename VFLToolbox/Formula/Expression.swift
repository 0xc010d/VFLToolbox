import UIKit

public protocol Expressionable {}
extension Attribute : Expressionable {}
extension Expression : Expressionable {}

public class Expression {
    public let source: Attribute?
    public var multiplier: CGFloat = 1
    public var constant: CGFloat = 0

    private init(){}
    init(constant: CGFloat) {
        self.constant = constant
    }
    init(multiplier: CGFloat) {
        self.multiplier = multiplier
    }
    init(attribute: Attribute) {
        self.source = attribute
    }
    private init(attribute: Attribute, constant: CGFloat) {
        self.source = attribute
        self.constant = constant
    }
    private init(attribute: Attribute, multiplier: CGFloat) {
        self.source = attribute
        self.multiplier = multiplier
    }
}

public func +<E: Expressionable, C: Constantable>(argument: E, constant: C) -> Expression! {
    switch argument {
    case let attribute as Attribute:
        return Expression(attribute: attribute, constant: ConstantableMakeCGFloat(constant))
    case let expression as Expression:
        expression.constant += ConstantableMakeCGFloat(constant)
        return expression
    default:
        assert(false, "Should not reach here")
        return nil
    }
}
public func +<C: Constantable, E: Expressionable>(constant: C, argument: E) -> Expression {
    return argument + constant
}

public func -<E: Expressionable, C: Constantable>(argument: E, constant: C) -> Expression {
    return argument + (-ConstantableMakeCGFloat(constant))
}

public func *<E: Expressionable, C: Constantable>(argument: E, multiplier: C) -> Expression {
    switch argument {
    case let attribute as Attribute:
        return Expression(attribute: attribute, multiplier: ConstantableMakeCGFloat(multiplier))
    case let expression as Expression:
        expression.multiplier *= ConstantableMakeCGFloat(multiplier)
        return expression
    default:
        assert(false, "Should not reach here")
        return Expression()
    }
}
public func *<C: Constantable, E: Expressionable>(multiplier: C, argument: E) -> Expression {
    return argument * multiplier
}

public func /<E: Expressionable, C: Constantable>(argument: E, multiplier: C) -> Expression {
    return argument * (1 / ConstantableMakeCGFloat(multiplier))
}
