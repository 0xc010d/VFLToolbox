import UIKit

public protocol Constantable {}

extension Int : Constantable {}
extension UInt : Constantable {}
extension Int8 : Constantable {}
extension UInt8 : Constantable {}
extension Int16 : Constantable {}
extension UInt16 : Constantable {}
extension Int32 : Constantable {}
extension UInt32 : Constantable {}
extension Int64 : Constantable {}
extension UInt64 : Constantable {}
extension Float : Constantable {}
extension Double : Constantable {}
extension CGFloat : Constantable {}

public func ConstantableMakeCGFloat(value: Constantable) -> CGFloat {
    switch value {
    case let argument as Int:
        return CGFloat(argument)
    case let argument as UInt:
        return CGFloat(argument)
    case let argument as Int8:
        return CGFloat(argument)
    case let argument as UInt8:
        return CGFloat(argument)
    case let argument as Int16:
        return CGFloat(argument)
    case let argument as UInt16:
        return CGFloat(argument)
    case let argument as Int32:
        return CGFloat(argument)
    case let argument as UInt32:
        return CGFloat(argument)
    case let argument as Int64:
        return CGFloat(argument)
    case let argument as UInt64:
        return CGFloat(argument)
    case let argument as Float:
        return CGFloat(argument)
    case let argument as Double:
        return CGFloat(argument)
    case let argument as CGFloat:
        return argument
    default:
        assert(false, "Should not reach here")
        return 0
    }
}
