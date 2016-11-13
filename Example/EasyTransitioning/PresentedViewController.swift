//
//  PresentedViewController.swift
//  EasyTransitioning
//
//  Created by Jerry Yu on 2016-11-13.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class PresentedViewController: UIViewController {

	let backgroundView = UIView()
	let label = UILabel()
	let squareView = UIView(frame: CGRectZero)

	static func frameForSquareView(inViewOfSize size: CGSize) -> CGRect {
		return CGRectMake(PADDING, size.height - 4*PADDING, 2*PADDING, 2*PADDING)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .whiteColor()

		// We no longer need to embed this inside a container because
		// ETTransitionController keeps the previous snapshot view
		let backgroundFrame = view.bounds
		backgroundView.backgroundColor = UIColor.orangeColor()
		backgroundView.frame = backgroundFrame
		view.addSubview(backgroundView)

		label.frame = CGRectMake(0, view.bounds.height - 28, view.bounds.width, 28)
		label.text = "Presented View Controller"
		label.textAlignment = .Center
		view.addSubview(label)

		squareView.frame = PresentedViewController.frameForSquareView(inViewOfSize: view.bounds.size)
		squareView.backgroundColor = .blueColor()
		view.addSubview(squareView)

		let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismiss))
		view.addGestureRecognizer(gestureRecognizer)
	}

	func dismiss() {
		dismissViewControllerAnimated(true, completion: nil)
	}

}
