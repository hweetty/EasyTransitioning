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

## Requirements

- iOS 7+

## Author

Jerry Yu

## License

EasyTransition is available under the MIT license. See the LICENSE file for more info.
