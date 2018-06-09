//
//  PlateauController.swift
//  Jeu de dame
//
//  Created by Adrien Lefaure on 25/05/2018.
//  Copyright © 2018 Adrien LEFAURE. All rights reserved.
//

import UIKit

class PlateauController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var plateauCollectionView: UICollectionView!
    
    var game = Game()
    let identifierCell = "CaseCollectionViewCell"
    var imageView: UIImageView?
    var currentCell: CaseCollectionViewCell?
    var beganPosition: CGPoint?
    var beganCellHavePion: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        game.startGame()
        
        plateauCollectionView.delegate = self
        plateauCollectionView.dataSource = self
        plateauCollectionView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture)))
        
        plateauCollectionView.register(UINib.init(nibName: "CaseCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifierCell)
    
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        plateauCollectionView.collectionViewLayout.invalidateLayout()
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

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = plateauCollectionView.frame.height / 10
        let widht = plateauCollectionView.frame.width / 10
        return CGSize(width: widht, height: height)
    }
}
