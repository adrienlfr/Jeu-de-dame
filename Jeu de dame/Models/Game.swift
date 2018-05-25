//
//  Game.swift
//  Jeu de dame
//
//  Created by Adrien Lefaure on 25/05/2018.
//  Copyright © 2018 Adrien LEFAURE. All rights reserved.
//

import Foundation
import UIKit

struct Game {
    
    var plateau = [Case]()
    var nbTour: Int = 0
    var joueur: String = "Joueur 1"
    
    mutating func startGame() {
        for _ in 0..<2 {
            for _ in 0..<5 {
                plateau.append(Case(fond: #imageLiteral(resourceName: "fondWhite"), contientPion: false, color: nil))
                plateau.append(Case(fond: #imageLiteral(resourceName: "fondBlack"), contientPion: true, color: UIColor.black))
            }
            for _ in 0..<5 {
                plateau.append(Case(fond: #imageLiteral(resourceName: "fondBlack"), contientPion: true, color: UIColor.black))
                plateau.append(Case(fond: #imageLiteral(resourceName: "fondWhite"), contientPion: false, color: nil))
            }
        }

        for _ in 0..<5 {
            plateau.append(Case(fond: #imageLiteral(resourceName: "fondWhite"), contientPion: false, color: nil))
            plateau.append(Case(fond: #imageLiteral(resourceName: "fondBlack"), contientPion: false, color: nil))
        }
        for _ in 0..<5 {
            plateau.append(Case(fond: #imageLiteral(resourceName: "fondBlack"), contientPion: false, color: nil))
            plateau.append(Case(fond: #imageLiteral(resourceName: "fondWhite"), contientPion: false, color: nil))
        }

        for _ in 0..<2 {
            for _ in 0..<5 {
                plateau.append(Case(fond: #imageLiteral(resourceName: "fondWhite"), contientPion: false, color: nil))
                plateau.append(Case(fond: #imageLiteral(resourceName: "fondBlack"), contientPion: true, color: UIColor.white))
            }
            for _ in 0..<5 {
                plateau.append(Case(fond: #imageLiteral(resourceName: "fondBlack"), contientPion: true, color: UIColor.white))
                plateau.append(Case(fond: #imageLiteral(resourceName: "fondWhite"), contientPion: false, color: nil))
            }
        }
    }
    
}
