//
//  Presented3ViewController.swift
//  EasyTransitioning
//
//  Created by Jerry Yu on 2017-03-28.
//  Copyright © 2017 Jerry Yu. All rights reserved.
//

import UIKit

class Presented3ViewController: UIViewController {

  let imageView = UIImageView(image: UIImage(named: "fox"))

  override var preferredStatusBarStyle : UIStatusBarStyle {
    return .lightContent
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .black

    imageView.contentMode = .scaleAspectFit
    view.addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.pinRatio(ratioOfImage(imageView.image!))
    NSLayoutConstraint.activate([
      imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      imageView.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor),
      imageView.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor),
    ])

    let gest = UITapGestureRecognizer(target: self, action: #selector(close))
    view.addGestureRecognizer(gest)
  }

  func close() {
    self.dismiss(animated: true, completion: nil)
  }

  func ratioOfImage(_ image: UIImage) -> CGFloat {
    return image.size.width / image.size.height
  }

}
