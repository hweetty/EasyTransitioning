__EasyTransitioning__ makes it easier to create seemless transitions when presenting view controllers.

### Why?

Users expect applications to be immersive more than ever. Historically this can be accomplished by providing eye candy animations. The next step is to create seemless transitions between different screens to increase continuity of the task.

# Example

### Fade in/out
```swift
// 1) Create a `ETTransitionController` instance with strong reference
self.transitionController = ETTransitionController()

// Perform your normal setup
let modalViewController = MyModalViewController()

// 2) Specify the animations that you want to perform
self.transitionController.elements = [
  backgroundView.easyTransition(ETFrameAction(toFrame: self.view.bounds, fromFrame: backgroundView.frame)),
  titleLabel.easyTransition(ETFrameAction(toFrame: CGRectOffset(titleLabel.frame, 20, 16), fromFrame: titleLabel.frame)),
  button.easyTransition(ETFadeAction(toAlpha: 0, fromAlpha: 1)),
  otherView.easyTransition(ETCornerRadiusAction(toCornerRadius: 8, fromCornerRadius: 0)),
]
// Optionally specify a custom duration
self.transitionController.animationDuration = 0.42

// 3) Assign this transitioning delegate and present the modal!
modalViewController.transitioningDelegate = self.transitionController
self.presentViewController(modelViewController, animated: true, completion: nil)

```

# How it works

There is a lot of boilerplate code assosciated with `UIViewControllerAnimatedTransitioning`. This library makes it easier by implementing the required protocols and providing a more expressive way to specify transitions.

A transition is essentially a set of animations between the existing view controller and the presenting modal view controller. Each animation has a _from_ and a _to_ state, similar to the concept of [tweening](https://en.wikipedia.org/wiki/Inbetweening).

`ETAction` protocol represents the animation of a single property. There are some bundled actions such as `ETCornerRadiusAction` and `ETFrameAction`for manipulating the `cornerRadius` and `frame` attributes respectively. It is also possible to create your own custom action by conforming to this protocol.

There might be multiple attributes comprising of an animation on a single view. `ETElement` stores a view and an array of `ETAction`'s. By default it manipulates a [_snapshot_](https://developer.apple.com/reference/uikit/uiview/1622531-snapshotviewafterscreenupdates) of the given view instead of it directly. However you can instead create an actual copy of your view if snapshotting should not be used (eg. animating the frame of a aspect-fit UIImageView).

# Further reading
- [ ] WWDC 2013 [Custom Transitions Using View Controllers](https://developer.apple.com/videos/play/wwdc2013/218/) 
- [ ] WWDC 2013 [Implementing Engaging UI on iOS](https://developer.apple.com/videos/play/wwdc2013/226/) 
- [ ] objc.io [View Controller Transitions](https://www.objc.io/issues/5-ios7/view-controller-transitions/)

## Requirements

- iOS 7+

## Author

Jerry Yu

## License

EasyTransitioning is available under the MIT license. See the LICENSE file for more info.
