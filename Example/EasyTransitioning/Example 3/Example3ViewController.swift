//
//  Example3ViewController.swift
//  EasyTransitioning
//
//  Created by Jerry Yu on 2017-03-28.
//  Copyright © 2017 Jerry Yu. All rights reserved.
//

import UIKit
import EasyTransitioning

class Example3ViewController: UIViewController {

  let cardView = UIView()

  let transitionController = ETTransitionController()

  override func viewDidLoad() {
    super.viewDidLoad()

    cardView.backgroundColor = UIColor.orange.withAlphaComponent(0.8)
    view.addSubview(cardView)
    cardView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      cardView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
      cardView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.75),
    ])

    let gest = UITapGestureRecognizer(target: self, action: #selector(showDetails))
    view.addGestureRecognizer(gest)
  }

  func showDetails() {
    let vc = Presented3ViewController()

    let whiteBackgroundView = UIView(frame: view.bounds)
    whiteBackgroundView.backgroundColor = .white

    transitionController.elements = [
      whiteBackgroundView.easyTransition([], shouldSnapshot: false),
      vc.view.easyTransition([
        ETFadeAction(toAlpha: 1, fromAlpha: 0),
        ETTransformAction(to: CGAffineTransform.identity, from: CGAffineTransform(scaleX: 0.75, y: 0.75))
      ], shouldSnapshot: false),
      cardView.easyTransition([
        ETFrameAction(toFrame: view.bounds, fromFrameOfView: cardView),
        ETFadeAction(toAlpha: 0, fromAlpha: 1),
      ])
    ]
    vc.transitioningDelegate = transitionController
    self.present(vc, animated: true, completion: nil)
  }

}
