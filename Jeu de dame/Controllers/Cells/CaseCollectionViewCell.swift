//
//  CaseCollectionViewCell.swift
//  Jeu de dame
//
//  Created by Adrien Lefaure on 25/05/2018.
//  Copyright © 2018 Adrien LEFAURE. All rights reserved.
//

import UIKit

class CaseCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var fondImage: UIImageView!
    @IBOutlet weak var pion: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configuration(image: UIImage, colorPion: PionColor) {
        fondImage.image = image
        pion.isHidden = false
        switch colorPion {
        case .blanc:
            pion.backgroundColor = UIColor.white
        case .noir:
            pion.backgroundColor = UIColor.black
        case .vide:
            pion.isHidden = true
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        pion.layer.cornerRadius = frame.size.width / 2.0
    }    
}
