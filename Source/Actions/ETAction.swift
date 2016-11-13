//
//  ETAction.swift
//  EasyTransition
//
//  Created by Jerry Yu on 2016-11-12.
//  Copyright © 2016 Jerry Yu. All rights reserved.
//

import UIKit

public protocol ETAction {
	func setup(snapshotView: UIView?, in containerView: UIView)
	func animate(snapshotView: UIView?, in containerView: UIView, animationDuration: NSTimeInterval)
	func completed(snapshotView: UIView?, in containerView: UIView)

	func reversed() -> ETAction
}

public extension ETAction {
	// Default no-op
	func setup(snapshotView: UIView?, in containerView: UIView) {}
	func animate(snapshotView: UIView?, in containerView: UIView, animationDuration: NSTimeInterval) {}
	func completed(snapshotView: UIView?, in containerView: UIView) {}

	func reversed() -> ETAction { return self }
}
