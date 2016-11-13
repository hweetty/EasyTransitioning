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
		self.snapshotView = shouldSnapshot ? view.snapshotViewAfterScreenUpdates(true) : view
		snapshotView?.frame = view.superview?.convertRect(view.frame, toView: nil) ?? view.frame
	}

	init(view: UIView, action: ETAction) {
		self.init(view: view, actions: [action])
	}

	private init(actions: [ETAction], snapshotView: UIView?) {
		self.actions = actions
		self.snapshotView = snapshotView
	}

	public func reversed() -> ETElement {
		let reversedActions = actions.map{ $0.reversed() }
		return ETElement(actions: reversedActions, snapshotView: snapshotView)
	}
}

public extension UIView {

	func easyTransition(actions: [ETAction], shouldSnapshot: Bool = true) -> ETElement {
		return ETElement(view: self, actions: actions, shouldSnapshot: shouldSnapshot)
	}

	func easyTransition(action: ETAction, shouldSnapshot: Bool = true) -> ETElement {
		return easyTransition([action], shouldSnapshot: shouldSnapshot)
	}

}
