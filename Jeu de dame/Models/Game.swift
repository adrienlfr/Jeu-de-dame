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
                plateau.append(Case(fond: #imageLiteral(resourceName: "fondWhite"), pionColor: .vide))
                plateau.append(Case(fond: #imageLiteral(resourceName: "fondBlack"), pionColor: .noir))
            }
            for _ in 0..<5 {
                plateau.append(Case(fond: #imageLiteral(resourceName: "fondBlack"), pionColor: .noir))
                plateau.append(Case(fond: #imageLiteral(resourceName: "fondWhite"), pionColor: .vide))
            }
        }

        for _ in 0..<5 {
            plateau.append(Case(fond: #imageLiteral(resourceName: "fondWhite"), pionColor: .vide))
            plateau.append(Case(fond: #imageLiteral(resourceName: "fondBlack"), pionColor: .vide))
        }
        for _ in 0..<5 {
            plateau.append(Case(fond: #imageLiteral(resourceName: "fondBlack"), pionColor: .vide))
            plateau.append(Case(fond: #imageLiteral(resourceName: "fondWhite"), pionColor: .vide))
        }

        for _ in 0..<2 {
            for _ in 0..<5 {
                plateau.append(Case(fond: #imageLiteral(resourceName: "fondWhite"), pionColor: .vide))
                plateau.append(Case(fond: #imageLiteral(resourceName: "fondBlack"), pionColor: .blanc))
            }
            for _ in 0..<5 {
                plateau.append(Case(fond: #imageLiteral(resourceName: "fondBlack"), pionColor: .blanc))
                plateau.append(Case(fond: #imageLiteral(resourceName: "fondWhite"), pionColor: .vide))
            }
        }
    }
    
}
