import UIKit

public protocol Constraintable {}

extension Int : Constraintable {}
extension UInt : Constraintable {}
extension Int8 : Constraintable {}
extension UInt8 : Constraintable {}
extension Int16 : Constraintable {}
extension UInt16 : Constraintable {}
extension Int32 : Constraintable {}
extension UInt32 : Constraintable {}
extension Int64 : Constraintable {}
extension UInt64 : Constraintable {}
extension Float : Constraintable {}
extension Double : Constraintable {}
extension CGFloat : Constraintable {}
extension Attribute : Constraintable {}
extension Expression : Constraintable {}

func ConstraintableMakeExpression(value: Constraintable) -> Expression! {
    switch value {
    case let value as Int:
        return Expression(constant: CGFloat(value))
    case let value as UInt:
        return Expression(constant: CGFloat(value))
    case let value as Int8:
        return Expression(constant: CGFloat(value))
    case let value as UInt8:
        return Expression(constant: CGFloat(value))
    case let value as Int16:
        return Expression(constant: CGFloat(value))
    case let value as UInt16:
        return Expression(constant: CGFloat(value))
    case let value as Int32:
        return Expression(constant: CGFloat(value))
    case let value as UInt32:
        return Expression(constant: CGFloat(value))
    case let value as Int64:
        return Expression(constant: CGFloat(value))
    case let value as UInt64:
        return Expression(constant: CGFloat(value))
    case let value as Float:
        return Expression(constant: CGFloat(value))
    case let value as Double:
        return Expression(constant: CGFloat(value))
    case let value as CGFloat:
        return Expression(constant: value)
    case let value as Attribute:
        return Expression(attribute: value)
    case let value as Expression:
        return value
    default:
        assert(false, "Should not reach here")
        return nil
    }
}
