//
//  ETElement.swift
//  EasyTransitioning
//
//  Created by Jerry Yu on 2016-11-12.
//  Copyright © 2016 Jerry Yu. All rights reserved.
//

import UIKit

public struct ETElement {
	public var actions: [ETAction]

	internal var snapshotView: UIView?

	init(view: UIView, actions: [ETAction] = [], shouldSnapshot: Bool = true) {
		self.actions = actions
		self.snapshotView = shouldSnapshot ? view.snapshotView(afterScreenUpdates: true) : view
		snapshotView?.frame = view.superview?.convert(view.frame, to: nil) ?? view.frame
	}

	init(view: UIView, action: ETAction) {
		self.init(view: view, actions: [action])
	}

	fileprivate init(actions: [ETAction], snapshotView: UIView?) {
		self.actions = actions
		self.snapshotView = snapshotView
	}

	public func reversed() -> ETElement {
		let reversedActions = actions.map{ $0.reversed() }
		return ETElement(actions: reversedActions, snapshotView: snapshotView)
	}
}

public extension UIView {

	func easyTransition(_ actions: [ETAction], shouldSnapshot: Bool = true) -> ETElement {
		return ETElement(view: self, actions: actions, shouldSnapshot: shouldSnapshot)
	}

	func easyTransition(_ action: ETAction, shouldSnapshot: Bool = true) -> ETElement {
		return easyTransition([action], shouldSnapshot: shouldSnapshot)
	}

}
