import UIKit

public class Superview {

    let mode: SuperviewMode
    let predicate: Predicate
    init(mode: SuperviewMode, predicate: Predicate = ==0) {
        self.mode = mode
        self.predicate = predicate
    }

}
