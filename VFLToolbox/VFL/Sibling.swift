import UIKit

public class Sibling {

    let item: AnyObject
    let predicate: Predicate
    init(item: AnyObject, predicate: Predicate = ==0) {
        self.item = item
        self.predicate = predicate
    }

}
