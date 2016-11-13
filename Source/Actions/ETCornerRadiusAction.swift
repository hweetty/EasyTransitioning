//
//  ETCornerRadiusAction.swift
//  EasyTransition
//
//  Created by Jerry Yu on 2016-11-12.
//  Copyright © 2016 Jerry Yu. All rights reserved.
//

import UIKit

public struct ETCornerRadiusAction: ETAction {
	let toCornerRadius: CGFloat
	let fromCornerRadius: CGFloat

	init(toCornerRadius: CGFloat, fromCornerRadius: CGFloat) {
		self.toCornerRadius = toCornerRadius
		self.fromCornerRadius = fromCornerRadius
	}

	public func setup(snapshotView: UIView?, in containerView: UIView) {
		guard let snapshotView = snapshotView else { return }
		snapshotView.layer.cornerRadius = fromCornerRadius
	}

	public func animate
		(snapshotView: UIView?, in containerView: UIView, animationDuration: NSTimeInterval) {
		guard let snapshotView = snapshotView else { return }
		snapshotView.layer.masksToBounds = true
		let animation = CABasicAnimation(keyPath: "cornerRadius")
		animation.toValue = toCornerRadius
		animation.duration = animationDuration
		snapshotView.layer.addAnimation(animation, forKey: "cornerRadius")
	}

	public func reversed() -> ETAction {
		return ETCornerRadiusAction(toCornerRadius: fromCornerRadius, fromCornerRadius: toCornerRadius)
	}
}
