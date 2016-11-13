//
//  ViewController.swift
//  EasyTransitioning
//
//  Created by Jerry Yu on 11/13/2016.
//  Copyright (c) 2016 Jerry Yu. All rights reserved.
//

import UIKit
import EasyTransitioning

let PADDING: CGFloat = 32

class ViewController: UIViewController {

	// Need a strong reference because `UIViewController.transitioningDelegate` is `weak`
	let transitionController = ETTransitionController()

	let backgroundView = UIView()
	let label = UILabel()
	let squareView = UIView(frame: CGRectMake(2*PADDING, 2*PADDING, PADDING, PADDING))

    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .whiteColor()

		// We take a snapshot when presenting so we cannot directly change the
		// backgroundView's `layer.cornerRadius`. Instead we embed it inside a container and change instead.
		let backgroundFrame = CGRectInset(view.bounds, PADDING, PADDING)
		let roundedContainerView = UIView(frame: backgroundFrame)
		roundedContainerView.backgroundColor = .clearColor()
		roundedContainerView.layer.cornerRadius = 8
		roundedContainerView.layer.masksToBounds = true
		view.addSubview(roundedContainerView)

		backgroundView.backgroundColor = UIColor.orangeColor()
		backgroundView.frame = roundedContainerView.bounds
		roundedContainerView.addSubview(backgroundView)

		label.frame = CGRectMake(0, view.bounds.height - PADDING - 28, view.bounds.width, 28)
		label.text = "Main View Controller"
		label.textAlignment = .Center
		view.addSubview(label)

		squareView.backgroundColor = .blueColor()
		view.addSubview(squareView)

		let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(present))
		view.addGestureRecognizer(gestureRecognizer)
    }

	func present() {
		let presentedVC = PresentedViewController()
		transitionController.elements = createPresentationElements(presentedVC)
		transitionController.animationDuration = 0.5
		presentedVC.transitioningDelegate = transitionController
		presentViewController(presentedVC, animated: true, completion: nil)
	}

	func createPresentationElements(presentedVC: PresentedViewController) -> [ETElement] {
		let squreToFrame = PresentedViewController.frameForSquareView(inViewOfSize: view.bounds.size)

		_ = presentedVC.view
		// Add in order of z-index (last element will be topmost)
		backgroundView.layer.cornerRadius = 0

		let elements: [ETElement] = [
			backgroundView.easyTransition([
				ETCornerRadiusAction(toCornerRadius: 0, fromCornerRadius: 8),
				ETFrameAction(toFrame: view.bounds, fromFrameOfView: backgroundView),
			]),
			label.easyTransition(ETFadeAction(toAlpha: 0, fromAlpha: 1)),
			squareView.easyTransition(ETFrameAction(toFrame: squreToFrame, fromFrameOfView: squareView)),
			presentedVC.label.easyTransition(ETFadeAction(toAlpha: 1, fromAlpha: 0)),
		]
		return elements
	}
}

