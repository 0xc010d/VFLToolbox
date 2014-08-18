import UIKit

public class Attribute {
    public let view: UIView
    public let attribute: NSLayoutAttribute
    private init(view: UIView, attribute: NSLayoutAttribute) {
        self.view = view
        self.attribute = attribute
    }
}

extension UIView {
    public var left: Attribute { get { return Attribute(view: self, attribute: .Left) } }
    public var right: Attribute { get { return Attribute(view: self, attribute: .Right) } }
    public var top: Attribute { get { return Attribute(view: self, attribute: .Top) } }
    public var bottom: Attribute { get { return Attribute(view: self, attribute: .Bottom) } }
    public var leading: Attribute { get { return Attribute(view: self, attribute: .Leading) } }
    public var trailing: Attribute { get { return Attribute(view: self, attribute: .Trailing) } }
    public var width: Attribute { get { return Attribute(view: self, attribute: .Width) } }
    public var height: Attribute { get { return Attribute(view: self, attribute: .Height) } }
    public var centerX: Attribute { get { return Attribute(view: self, attribute: .CenterX) } }
    public var centerY: Attribute { get { return Attribute(view: self, attribute: .CenterY) } }
    public var baseline: Attribute { get { return Attribute(view: self, attribute: .Baseline) } }
}
