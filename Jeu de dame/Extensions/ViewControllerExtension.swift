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
        guard imageView == nil || !imageView!.isAnimating else { return }
        let locationPoint = panGestureRecognizer.location(in: plateauCollectionView)
        if panGestureRecognizer.state == .began {
            // Create a current viewCell "screenshot" / TODO: only pionView should be duplicated
            if (locationPoint.x >= 0 && locationPoint.y >= 0) {
                let indexPathOfMovingCell = plateauCollectionView.indexPathForItem(at: locationPoint)!
                currentCell = plateauCollectionView.cellForItem(at: indexPathOfMovingCell)! as? CaseCollectionViewCell
                beganCellHavePion = !currentCell!.pion.isHidden
                
                guard let beganCell = currentCell, beganCell.fondImage.image == #imageLiteral(resourceName: "fondBlack"), beganCellHavePion else { return }
                beganPosition = locationPoint
                UIGraphicsBeginImageContext(currentCell!.pion.bounds.size)
                let ctx = UIGraphicsGetCurrentContext()!
                currentCell!.layer.render(in: ctx)
                let cellImage = UIGraphicsGetImageFromCurrentImageContext()
                imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: currentCell!.bounds.width, height: currentCell!.bounds.height))
                if let imageView = imageView {
                    imageView.image = cellImage
                    plateauCollectionView.addSubview(imageView)
                    imageView.center = locationPoint
                }
                
                currentCell!.pion.isHidden = true
                
                // TODO: make moving view bigger (as it is upper from other "pion")
                // use UIView transform property and CGAffineTransform(scaleX:y:) to achieve this
                
                // TODO: reconfigure current cell to be in state "moving away" (pion can have a alpha of 0.5 to
                // indicate this)
            }
        }
        guard let beganCell = currentCell, beganCell.fondImage.image == #imageLiteral(resourceName: "fondBlack"), beganCellHavePion else { return }
        if panGestureRecognizer.state == .changed {
            print("pan at \(locationPoint)")
            imageView?.center = locationPoint
        }
        
        if panGestureRecognizer.state == .ended {
            // TODO: manage if movement is valid (update model accordingly)
            let height = plateauCollectionView.frame.height
            let widht = plateauCollectionView.frame.width
            guard locationPoint.x >= 0, locationPoint.y >= 0, locationPoint.x <= widht, locationPoint.y <= height else { animationBackPion(position: beganPosition!); return }
            let index = plateauCollectionView.indexPathForItem(at: locationPoint)!
            let endedCell = plateauCollectionView.cellForItem(at: index) as! CaseCollectionViewCell
            
            guard endedCell.fondImage.image == #imageLiteral(resourceName: "fondBlack"), endedCell.pion.isHidden else { animationBackPion(position: beganPosition!); return }
            imageView?.removeFromSuperview()
            endedCell.pion.isHidden = false
            endedCell.pion.backgroundColor = beganCell.pion.backgroundColor!
        }
        
    }
    
    func animationBackPion(position: CGPoint) {
        UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
            if let pos = self.beganPosition {
                self.imageView?.center = pos
            }
        }) { (_) in
            self.currentCell?.pion.isHidden = false
            self.imageView?.removeFromSuperview()
        }
    }
}
