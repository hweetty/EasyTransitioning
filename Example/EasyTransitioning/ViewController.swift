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
	let squareView = UIView(frame: CGRect(x: 2*PADDING, y: 2*PADDING, width: PADDING, height: PADDING))

    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .white

		// We take a snapshot when presenting so we cannot directly change the
		// backgroundView's `layer.cornerRadius`. Instead we embed it inside a container and change instead.
		let backgroundFrame = view.bounds.insetBy(dx: PADDING, dy: PADDING)
		let roundedContainerView = UIView(frame: backgroundFrame)
		roundedContainerView.backgroundColor = .clear
		roundedContainerView.layer.cornerRadius = 8
		roundedContainerView.layer.masksToBounds = true
		view.addSubview(roundedContainerView)

		backgroundView.backgroundColor = UIColor.orange
		backgroundView.frame = roundedContainerView.bounds
		roundedContainerView.addSubview(backgroundView)

		label.frame = CGRect(x: 0, y: view.bounds.height - PADDING - 28, width: view.bounds.width, height: 28)
		label.text = "Main View Controller"
		label.textAlignment = .center
		view.addSubview(label)

		squareView.backgroundColor = .blue
		view.addSubview(squareView)

		let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showDetails))
		view.addGestureRecognizer(gestureRecognizer)
    }

	func showDetails() {
		let presentedVC = PresentedViewController()
		transitionController.elements = createPresentationElements(presentedVC)
		transitionController.animationDuration = 0.5
		presentedVC.transitioningDelegate = transitionController
		self.present(presentedVC, animated: true, completion: nil)
	}

	func createPresentationElements(_ presentedVC: PresentedViewController) -> [ETElement] {
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

