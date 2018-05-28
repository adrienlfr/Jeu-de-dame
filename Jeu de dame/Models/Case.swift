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
    var pionColor: PionColor
    
    init(fond: UIImage, pionColor: PionColor) {
        self.fond = fond
        self.pionColor = pionColor
    }
    
}
