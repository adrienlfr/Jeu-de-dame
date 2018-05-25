//
//  Case.swift
//  Jeu de dame
//
//  Created by Adrien Lefaure on 25/05/2018.
//  Copyright © 2018 Adrien LEFAURE. All rights reserved.
//

import Foundation
import UIKit

struct Case {
    
    var fond: UIImage
    var contientPion: Bool
    var color: UIColor?
    
    init(fond: UIImage, contientPion: Bool, color: UIColor?) {
        self.fond = fond
        self.contientPion = contientPion
        self.color = color
    }
    
}
