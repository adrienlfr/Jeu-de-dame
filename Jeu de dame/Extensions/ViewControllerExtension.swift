//
//  ViewControllerExtension.swift
//  Jeu de dame
//
//  Created by Adrien LEFAURE on 08/06/2018.
//  Copyright © 2018 Adrien LEFAURE. All rights reserved.
//

import Foundation
import UIKit

extension PlateauController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        // Manage an invalid drag (no pion on this case / not current pion to be played)
        return true
    }
    
    @objc func handlePanGesture(_ panGestureRecognizer: UIPanGestureRecognizer) {
        let locationPoint = panGestureRecognizer.location(in: plateauCollectionView)
        
        if panGestureRecognizer.state == .began {
            // Create a current viewCell "screenshot" / TODO: only pionView should be duplicated
            let indexPathOfMovingCell = plateauCollectionView.indexPathForItem(at: locationPoint)!
            let cell = plateauCollectionView.cellForItem(at: indexPathOfMovingCell)!
            UIGraphicsBeginImageContext(cell.bounds.size)
            let ctx = UIGraphicsGetCurrentContext()!
            cell.layer.render(in: ctx)
            let cellImage = UIGraphicsGetImageFromCurrentImageContext()
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: cell.bounds.width, height: cell.bounds.height))
            if let imageView = imageView {
                imageView.image = cellImage
                plateauCollectionView.addSubview(imageView)
                imageView.center = locationPoint
            }
            // TODO: make moving view bigger (as it is upper from other "pion")
            // use UIView transform property and CGAffineTransform(scaleX:y:) to achieve this
            // TODO: reconfigure current cell to be in state "moving away" (pion can have a alpha of 0.5 to
            // indicate this)
            
        }
        if panGestureRecognizer.state == .changed {
            print("pan at \(locationPoint)")
            imageView?.center = locationPoint
        }
        if panGestureRecognizer.state == .ended {
            // TODO: manage if movement is valid (update model accordingly)
            imageView?.removeFromSuperview()
        }
    }
}
