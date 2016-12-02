//
//  Presented2ViewController.swift
//  EasyTransitioning
//
//  Created by Jerry Yu on 2016-12-01.
//  Copyright © 2016 Jerry Yu. All rights reserved.
//

import UIKit

class Presented2ViewController: UIViewController {

	let imageView = UIImageView(image: UIImage(named: "fox"))

	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .blackColor()

		imageView.contentMode = .ScaleAspectFit
		view.addSubview(imageView)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.pinRatio(ratioOfImage(imageView.image!))
		NSLayoutConstraint.activateConstraints([
			imageView.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor),
			imageView.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor),
			imageView.widthAnchor.constraintLessThanOrEqualToAnchor(view.widthAnchor),
			imageView.heightAnchor.constraintLessThanOrEqualToAnchor(view.heightAnchor),
		])

		let gest = UITapGestureRecognizer(target: self, action: #selector(dismiss))
		view.addGestureRecognizer(gest)
	}

	func dismiss() {
		dismissViewControllerAnimated(true, completion: nil)
	}

	func ratioOfImage(image: UIImage) -> CGFloat {
		return image.size.width / image.size.height
	}

}

extension UIView {
	func pinRatio(widthToHeightRatio: CGFloat) {
		NSLayoutConstraint(item: self, attribute: .Width, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: widthToHeightRatio, constant: 0).active = true
	}
}
