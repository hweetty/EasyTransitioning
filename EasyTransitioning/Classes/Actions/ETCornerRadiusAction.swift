//
//  ETCornerRadiusAction.swift
//  EasyTransitioning
//
//  Created by Jerry Yu on 2016-11-12.
//  Copyright © 2016 Jerry Yu. All rights reserved.
//

import UIKit

public struct ETCornerRadiusAction: ETAction {
	public let toCornerRadius: CGFloat
	public let fromCornerRadius: CGFloat

	public init(toCornerRadius: CGFloat, fromCornerRadius: CGFloat) {
		self.toCornerRadius = toCornerRadius
		self.fromCornerRadius = fromCornerRadius
	}

	public func setup(snapshotView: UIView?, in containerView: UIView) {
		guard let snapshotView = snapshotView else { return }
		snapshotView.layer.cornerRadius = fromCornerRadius
	}

	public func animate(snapshotView: UIView?, in containerView: UIView, animationDuration: NSTimeInterval) {
		guard let snapshotView = snapshotView else { return }
		snapshotView.layer.masksToBounds = true
		let animation = CABasicAnimation(keyPath: "cornerRadius")
		animation.fromValue = snapshotView.layer.cornerRadius
		animation.duration = animationDuration
		snapshotView.layer.cornerRadius = toCornerRadius
		snapshotView.layer.addAnimation(animation, forKey: "cornerRadius")
	}

	public func reversed() -> ETAction {
		return ETCornerRadiusAction(toCornerRadius: fromCornerRadius, fromCornerRadius: toCornerRadius)
	}
}
