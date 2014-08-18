import UIKit

public protocol Predicatable {}

extension Int : Predicatable {}
extension UInt : Predicatable {}
extension Int8 : Predicatable {}
extension UInt8 : Predicatable {}
extension Int16 : Predicatable {}
extension UInt16 : Predicatable {}
extension Int32 : Predicatable {}
extension UInt32 : Predicatable {}
extension Int64 : Predicatable {}
extension UInt64 : Predicatable {}
extension Float : Predicatable {}
extension Double : Predicatable {}
extension CGFloat : Predicatable {}
extension Predicate : Predicatable {}

func PredicatableMakePredicate(value: Predicatable) -> Predicate! {
    switch value {
    case let value as Int:
        return ==value
    case let value as UInt:
        return ==value
    case let value as Int8:
        return ==value
    case let value as UInt8:
        return ==value
    case let value as Int16:
        return ==value
    case let value as UInt16:
        return ==value
    case let value as Int32:
        return ==value
    case let value as UInt32:
        return ==value
    case let value as Int64:
        return ==value
    case let value as UInt64:
        return ==value
    case let value as Float:
        return ==value
    case let value as Double:
        return ==value
    case let value as CGFloat:
        return ==value
    case let value as Predicate:
        return value
    default:
        assert(false, "Should not reach here")
        return nil
    }
}
