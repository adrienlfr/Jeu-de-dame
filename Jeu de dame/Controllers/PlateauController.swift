//
//  PlateauController.swift
//  Jeu de dame
//
//  Created by Adrien Lefaure on 25/05/2018.
//  Copyright © 2018 Adrien LEFAURE. All rights reserved.
//

import UIKit

class PlateauController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var plateauCollectionView: UICollectionView!
    
    var game = Game()
    let identifierCell = "CaseCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        game.startGame()
        
        plateauCollectionView.delegate = self
        plateauCollectionView.dataSource = self
        
        plateauCollectionView.register(UINib.init(nibName: "CaseCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifierCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return game.plateau.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = plateauCollectionView.dequeueReusableCell(withReuseIdentifier: identifierCell, for: indexPath) as! CaseCollectionViewCell
        let laCase = game.plateau[indexPath.row]
        cell.configuration(image: laCase.fond, colorPion: laCase.pionColor)
        return cell
    }

}
