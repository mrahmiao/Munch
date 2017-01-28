//
//  Munch.swift
//  Munch
//
//  Created by mrahmiao on 9/5/16.
//  Copyright © 2016 NSTweak. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation
import CoreGraphics

// MARK: - CGPoint
extension CGPoint {
  public static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
  }

  public static func + (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x + scalar, y: point.y + scalar)
  }

  public static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
  }

  public static func - (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x - scalar, y: point.y - scalar)
  }

  public static func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x * scalar, y: point.y * scalar)
  }

  public static func / (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x / scalar, y: point.y / scalar)
  }

  public func distance(to point: CGPoint) -> CGFloat {
    return sqrt(pow(x.distance(to: point.x), 2) + pow(y.distance(to: point.y), 2))
  }

  public func rounded() -> CGPoint {
    return CGPoint(x: x.rounded(), y: y.rounded())
  }

  public func halfRounded() -> CGPoint {
    return CGPoint(x: (x * 2).rounded() / 2, y: (y * 2).rounded() / 2)
  }
}

// MARK: - CGRect
extension CGRect {
  public var center: CGPoint {
    return CGPoint(x: midX, y: midY)
  }

  public init(center: CGPoint, size: CGSize) {
    self.size = size
    self.origin = CGPoint(x: center.x - size.width / 2, y: center.y - size.height / 2)
  }

  public init(squareCenter: CGPoint, sideLength: CGFloat) {
    self.init(center: squareCenter, size: CGSize(width: sideLength * 2, height: sideLength * 2))
  }

  public func rect(byFittingIn destRect: CGRect) -> CGRect {
    let aspect = size.aspectScale(fitIn: destRect)
    let targetSize = size * aspect
    return CGRect(center: destRect.center, size: targetSize)
  }

  public func rect(byFillingIn destRect: CGRect) -> CGRect {
    let aspect = size.aspectScale(fillIn: destRect)
    let targetSize = size * aspect
    return CGRect(center: destRect.center, size: targetSize)
  }

  public func rounded() -> CGRect {
    return CGRect(origin: origin.rounded(), size: size.rounded())
  }
}

// MARK: - CGSize
extension CGSize {
  public static func * (aSize: CGSize, factor: CGFloat) -> CGSize {
    return CGSize(width: aSize.width * factor, height: aSize.height * factor)
  }

  public static func / (aSize: CGSize, scalar: CGFloat) -> CGSize {
    return CGSize(width: aSize.width / scalar, height: aSize.height / scalar)
  }

  public static func + (aSize: CGSize, scalar: CGFloat) -> CGSize {
    return CGSize(width: aSize.width + scalar, height: aSize.height + scalar)
  }

  private func scales(with rect: CGRect) -> (CGFloat, CGFloat) {
    let size = rect.size
    return (size.width / width, size.height / height)
  }

  public func aspectScale(fitIn rect: CGRect) -> CGFloat {
    let (scaleW, scaleH) = scales(with: rect)
    return min(scaleW, scaleH)
  }

  public func aspectScale(fillIn rect: CGRect) -> CGFloat {
    let (scaleW, scaleH) = scales(with: rect)
    return max(scaleW, scaleH)
  }

  public func rounded() -> CGSize {
    return CGSize(width: width.rounded(), height: height.rounded())
  }
}
