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
        isUserInteractionEnabled = true
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touches began")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        print("Touch")
        guard let vue = touch.view as? UIView else { return }
        print("Vue")
        print("Touches moved")
        let position = touch.location(in: self)
        vue.center = position
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touches ended")
    }
    
}
