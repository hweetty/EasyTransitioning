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
	let squareView = UIView(frame: CGRect.zero)

	static func frameForSquareView(inViewOfSize size: CGSize) -> CGRect {
		return CGRect(x: PADDING, y: size.height - 4*PADDING, width: 2*PADDING, height: 2*PADDING)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white

		// We no longer need to embed this inside a container because
		// ETTransitionController keeps the previous snapshot view
		let backgroundFrame = view.bounds
		backgroundView.backgroundColor = UIColor.orange
		backgroundView.frame = backgroundFrame
		view.addSubview(backgroundView)

		label.frame = CGRect(x: 0, y: view.bounds.height - 28, width: view.bounds.width, height: 28)
		label.text = "Presented View Controller"
		label.textAlignment = .center
		view.addSubview(label)

		squareView.frame = PresentedViewController.frameForSquareView(inViewOfSize: view.bounds.size)
		squareView.backgroundColor = .blue
		view.addSubview(squareView)

		let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(close))
		view.addGestureRecognizer(gestureRecognizer)
	}

	func close() {
		self.dismiss(animated: true, completion: nil)
	}

}
