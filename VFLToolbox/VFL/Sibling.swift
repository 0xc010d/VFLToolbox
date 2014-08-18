import UIKit

public class Sibling {

    let view: UIView
    let predicate: Predicate
    init(view: UIView, predicate: Predicate = ==0) {
        self.view = view
        self.predicate = predicate
    }

}
