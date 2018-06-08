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
                plateau.append(Case(fond: .light, pionColor: .vide))
                plateau.append(Case(fond: .dark, pionColor: .noir))
            }
            for _ in 0..<5 {
                plateau.append(Case(fond: .dark, pionColor: .noir))
                plateau.append(Case(fond: .light, pionColor: .vide))
            }
        }

        for _ in 0..<5 {
            plateau.append(Case(fond: .light, pionColor: .vide))
            plateau.append(Case(fond: .dark, pionColor: .vide))
        }
        for _ in 0..<5 {
            plateau.append(Case(fond: .dark, pionColor: .vide))
            plateau.append(Case(fond: .light, pionColor: .vide))
        }

        for _ in 0..<2 {
            for _ in 0..<5 {
                plateau.append(Case(fond: .light, pionColor: .vide))
                plateau.append(Case(fond: .dark, pionColor: .blanc))
            }
            for _ in 0..<5 {
                plateau.append(Case(fond: .dark, pionColor: .blanc))
                plateau.append(Case(fond: .light, pionColor: .vide))
            }
        }
    }
    
}
