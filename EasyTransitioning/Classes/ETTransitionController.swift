//
//  ETTransitionController.swift
//  EasyTransitioning
//
//  Created by Jerry Yu on 2016-11-11.
//  Copyright © 2016 Jerry Yu. All rights reserved.
//

import UIKit

public enum ETAnimationOptions {
	case normal(options: UIViewAnimationOptions)
	case spring(damping: CGFloat, options: UIViewAnimationOptions)
}

open class ETTransitionController: NSObject {
	open var elements = [ETElement]()

	open var isReversed = false

	open var animationDuration: TimeInterval = 0.35
	open var animationOptions = ETAnimationOptions.normal(options: [.curveEaseInOut])
}

// MARK: UIViewControllerTransitioningDelegate

extension ETTransitionController: UIViewControllerTransitioningDelegate {
	public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		isReversed = false
		return self
	}

	public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		isReversed = true
		return self
	}
}

// MARK: UIViewControllerAnimatedTransitioning

extension ETTransitionController: UIViewControllerAnimatedTransitioning {
	public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
		return animationDuration
	}

	public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
		let containerView = transitionContext.containerView
		guard let toView = transitionContext.view(forKey: UITransitionContextViewKey.to),
			  let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from) else {
				transitionContext.completeTransition(true)
				return
		}

		if isReversed {
			fromView.removeFromSuperview()
			containerView.addSubview(toView)
		}

		var currentElements = elements
		if isReversed { currentElements = currentElements.map{ $0.reversed() } }
			
		currentElements.flatMap{ $0.snapshotView }.forEach{ containerView.addSubview($0) }

		currentElements.forEach{ element in
			element.actions.forEach{ $0.setup(snapshotView: element.snapshotView, in: containerView) }
		}

		animationHelper(animationOptions, animations: {
			currentElements.forEach{ element in
				element.actions.forEach{ $0.animate(snapshotView: element.snapshotView, in: containerView, animationDuration: self.animationDuration) }
			}
		}, completion: { _ in
			if !self.isReversed {
				containerView.addSubview(toView)
			}
			currentElements.forEach { element in
				element.actions.forEach{ $0.completed(snapshotView: element.snapshotView, in: containerView) }
			}
			transitionContext.completeTransition(true)
		})
	}

	fileprivate func animationHelper(_ options: ETAnimationOptions, animations: @escaping ()->Void, completion: @escaping (Bool)->Void) {
		switch options {
		case .normal(let options):
			UIView.animate(withDuration: animationDuration, delay: 0, options: options, animations: animations, completion: completion)
		case .spring(let damping, let options):
			UIView.animate(withDuration: animationDuration, delay: 0, usingSpringWithDamping: damping, initialSpringVelocity: 0, options: options, animations: animations, completion: completion)
		}
	}
}
