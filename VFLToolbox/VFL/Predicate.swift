import UIKit

public class Predicate {
    //TODO: public is not needed here, added just for test purposes
    public let constant: CGFloat
    public let relation: NSLayoutRelation
    private init(constant: CGFloat, relation: NSLayoutRelation) {
        self.constant = constant
        self.relation = relation
    }
}

prefix operator == {}
prefix operator <= {}
prefix operator >= {}

public prefix func ==<C: Constantable>(constant: C) -> Predicate {
    return Predicate(constant: ConstantableMakeCGFloat(constant), relation: NSLayoutRelation.Equal)
}
public prefix func <=<C: Constantable>(constant: C) -> Predicate {
    return Predicate(constant: ConstantableMakeCGFloat(constant), relation: NSLayoutRelation.LessThanOrEqual)
}
public prefix func >=<C: Constantable>(constant: C) -> Predicate {
    return Predicate(constant: ConstantableMakeCGFloat(constant), relation: NSLayoutRelation.GreaterThanOrEqual)
}
