//
//  Example2ViewController.swift
//  EasyTransitioning
//
//  Created by Jerry Yu on 2016-12-01.
//  Copyright © 2016 Jerry Yu. All rights reserved.
//

import UIKit
import EasyTransitioning

class Example2ViewController: UIViewController {

	let imageView = UIImageView(image: UIImage(named: "fox"))

	let transitionController = ETTransitionController()

	override func viewDidLoad() {
		super.viewDidLoad()

		imageView.contentMode = .scaleAspectFit
		view.addSubview(imageView)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: view.topAnchor),
			imageView.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.45),

			// We allow the width of the image to be flexible depending on image.
			imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
		])

		let gest = UITapGestureRecognizer(target: self, action: #selector(showDetails))
		view.addGestureRecognizer(gest)
	}

	func createImageViewCopy() -> UIView {
		// tl;dr A copy is needed (instead of using a snapshot) because UIImageView handles the aspect ratio for us.

		// This is because the visible image's width is constrained to aspect fit, so there is a
		// "transparent padding" on both sides. Thus manipulating a snapshot would squish the image,
		// whereas making a UIImageView copy handles it for us :).

		// You can see for yourself what happens if we use a snapshot by uncommenting the following.
//		let snapshot = imageView.snapshotViewAfterScreenUpdates(true)
//		return snapshot!

		let copy = UIImageView(image: imageView.image)
		copy.contentMode = imageView.contentMode
		copy.frame = imageView.frame
		return copy
	}

	func showDetails() {
		let imageViewCopy = createImageViewCopy()

		let blackBackgroundView = UIView()
		blackBackgroundView.backgroundColor = .black

		let vc = Presented2ViewController()
		vc.view.layoutSubviews()
		transitionController.elements = [
			// Both of these views are "temporary", so we don't need to snapshot.
			blackBackgroundView.easyTransition(ETFrameAction(toFrame: vc.view.bounds, fromFrameOfView: imageView), shouldSnapshot: false),
			imageViewCopy.easyTransition(ETFrameAction(toFrame: vc.imageView.frame, fromFrameOfView: imageView), shouldSnapshot: false),
		]
		vc.transitioningDelegate = transitionController
		self.present(vc, animated: true, completion: nil)
	}

}
