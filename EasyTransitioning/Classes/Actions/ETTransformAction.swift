//
//  ETTransformAction.swift
//  EasyTransitioning
//
//  Created by Jerry Yu on 2017-03-28.
//  Copyright © 2017 Jerry Yu. All rights reserved.
//

import Foundation

public struct ETTransformAction: ETAction {
  public let to: CGAffineTransform
  public let from: CGAffineTransform

  public init(to: CGAffineTransform, from: CGAffineTransform) {
    self.to = to
    self.from = from
  }

  public func setup(snapshotView: UIView?, in containerView: UIView) {
    guard let snapshotView = snapshotView else { return }
    snapshotView.transform = from
  }

  public func animate(snapshotView: UIView?, in containerView: UIView, animationDuration: TimeInterval) {
    guard let snapshotView = snapshotView else { return }
    snapshotView.transform = to
  }

  public func reversed() -> ETAction {
    return ETTransformAction(to: from, from: to)
  }
}
