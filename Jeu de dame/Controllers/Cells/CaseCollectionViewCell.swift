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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configuration(image: UIImage) {
        fondImage.image = image
    }

}
