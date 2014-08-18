# VFLToolbox

Autolayout is awesome! VFL a.k.a Visual Format Language is even more awesome because it allows you to shorten constraints setting code. The only problem of VFL is that you need to specify constraints as a parametrized string which is painful in maintenance.

__VFLToolbox__ brings that to the whole new level. So, from now on, no more runtime exceptions once you rename the view, no more nasty strings at all. You'll get notified in a compile time if something went wrong.

As they say, one example worth thousand words:

```swift
let view1 = UIView(), view2 = UIView(), superview = UIView()
let margin = 15
superview.addSubview(view1)
superview.addSubview(view2)

superview.addConstraints(V:|-margin-[view1]-margin-[view2]-margin-|)
```

Yes, this is it!

Of course, you could use `==`, `<=`, and `>=` to specify layout relations:

```swift
// This is probably the most common example of such a usage
superview.addConstraints(V:|-(==margin)-[view1]-(==margin)-[view2]-(>=margin)-|)
```

You can now use your favorite IDE to refactor the code:

![](https://raw.githubusercontent.com/0xc010d/VFLToolbox/assets/Renaming.gif)

Code suggestions work pretty smooth as well:

![](https://raw.githubusercontent.com/0xc010d/VFLToolbox/assets/Suggestions.gif)

Just compare it to the code which you need to write without VFLToolbox:

```swift
let metrics = [
    "margin" : margin,
]
let views = [
    "view1" : view1,
    "view2" : view2,
]
superview.addConstraints(
    NSLayoutConstraint.constraintsWithVisualFormat(
        "V:|-(==margin)-[view1]-(==margin)-[view2]-(>=margin)-|", 
        options: nil, 
        metrics: metrics, 
        views: views
    )
)
```

You can find more examples of __VFLToolbox__ usage in the *tests* target of the project (for example, [CommonCaseTests.swift](VFLToolboxTests/VFL/CommonCaseTests.swift))

## Formula

__VFLToolbox__ does not fully implement Apple's VFL. For example, you can't specify view's width with it, i.e. `H:[view1(==100)]` wouldn't work. It, may be, will be added in future, but, until then, you have another way to describe such (and many-many other) constraints. This example might be rewritten with __VFLToolbox__ as:

```swift
view1.width == 100
```

And, if you want to add it as a constraint – you can do it just like that:

```swift
superview.addConstraint(view1.width == 100)
```

Of course, you could use more complex equations:

```swift
struct StyleGuide {
    struct Margin {
        static var Top: CGFloat = 10
        static var Bottom: CGFloat = 10
    }
}

superview.addConstraint(view2.top == view1.bottom + StyleGuide.Margin.Top + StyleGuide.Margin.Bottom)
superview.addConstraint(view2.width == view1.width / 3 + 15) // why not?
```

As the result of the equations above is `NSLayoutConstraint`, you can assign it to the variable and do whatever you want with it (change the priority, animate the constant, etc.):

```swift
let constraint = view2.left == view2.right
constraint.constant += 15
```

You can find more examples in the *tests* target of the project

### Performance

Surprisingly, __VFLToolbox__'s performance is quite good, it is comparable with `UIKit` implementation for `NSLayoutConstraint.constraintsWithVisualFormat`. For more details, see the [Measurements.swift](VFLToolboxTests/VFL/Measurements.swift) (add it to the *tests* target to enable measurements).

### Roadmap

* Layout guides usage as an item in the constraint (e.g. `view.top == topLayoutGuide + 15`)
* Standard constants support (e.g. `V:|-[view1]-[view2]-|`)
* Multiple predicates support (e.g. `V:|-(>=5,<=8)-[view]|`)
* OS X support
* Constraint priority support (e.g. `V:|-(>=5@250,<=8@500)-[view]|`)

### Known issues

* Due to Swift implementation details, it's not possible to use long expressions (yet?).

For example, the following assignment would make cooler spinning like a crazy and, at the end, it wouldn't compile:

```swift
let t = 1 + 1 + 1 + 1 + 1 + 1 + 1.0 // You may split this equation to two to workaround the problem
```

Thus, long VFL expressions should be split to the smaller ones

### License

The code is released under MIT license (see LICENSE file for details)

#### Contact

Pull requests as well as bugreports are welcome here, on Github.
For other questions, drop me a line on Twitter: [@0xc010d](https://twitter.com/0xc010d)
