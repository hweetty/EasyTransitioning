//
//  ETTransitionController.swift
//  EasyTransitioning
//
//  Created by Jerry Yu on 2016-11-11.
//  Copyright © 2016 Jerry Yu. All rights reserved.
//

import UIKit

public class ETTransitionController: NSObject {
	public var elements = [ETElement]()
	public var animationDuration: NSTimeInterval = 0.35
	public var isReversed = false
}

// MARK: UIViewControllerTransitioningDelegate

extension ETTransitionController: UIViewControllerTransitioningDelegate {
	public func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		isReversed = false
		return self
	}

	public func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		isReversed = true
		return self
	}
}

// MARK: UIViewControllerAnimatedTransitioning

extension ETTransitionController: UIViewControllerAnimatedTransitioning {
	public func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
		return animationDuration
	}

	public func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
		let containerView = transitionContext.containerView()
		guard let toView = transitionContext.viewForKey(UITransitionContextToViewKey),
			  let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey) else {
				transitionContext.completeTransition(true)
				return
		}

		if isReversed {
			fromView.removeFromSuperview()
			containerView.addSubview(toView)
		}

		let currentElements = isReversed ? elements.map{ $0.reversed() } : elements
		currentElements.flatMap{ $0.snapshotView }.forEach{ containerView.addSubview($0) }

		currentElements.forEach{ element in
			element.actions.forEach{ $0.setup(element.snapshotView, in: containerView) }
		}

		let duration = transitionDuration(transitionContext)
		UIView.animateWithDuration(duration, animations: {
			currentElements.forEach{ element in
				element.actions.forEach{ $0.animate(element.snapshotView, in: containerView, animationDuration: duration) }
			}
		}, completion: { _ in
			if !self.isReversed {
				containerView.addSubview(toView)
			}
			currentElements.forEach { element in
				element.actions.forEach{ $0.completed(element.snapshotView, in: containerView) }
			}
			transitionContext.completeTransition(true)
		})
	}
}
