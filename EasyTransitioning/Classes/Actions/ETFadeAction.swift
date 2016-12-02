//
//  ETFadeAction.swift
//  EasyTransitioning
//
//  Created by Jerry Yu on 2016-11-12.
//  Copyright © 2016 Jerry Yu. All rights reserved.
//

import UIKit

public struct ETFadeAction: ETAction {
	public let toAlpha: CGFloat
	public let fromAlpha: CGFloat

	public init(toAlpha: CGFloat, fromAlpha: CGFloat) {
		self.toAlpha = toAlpha
		self.fromAlpha = fromAlpha
	}

	public func setup(snapshotView: UIView?, in containerView: UIView) {
		guard let snapshotView = snapshotView else { return }
		snapshotView.alpha = fromAlpha
	}

	public func animate(snapshotView: UIView?, in containerView: UIView, animationDuration: TimeInterval) {
		guard let snapshotView = snapshotView else { return }
		snapshotView.alpha = toAlpha
	}

	public func reversed() -> ETAction {
		return ETFadeAction(toAlpha: fromAlpha, fromAlpha: toAlpha)
	}
}
