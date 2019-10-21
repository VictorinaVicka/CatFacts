//
//  MainViewController.swift
//  CatFacts
//
//  Created by Виктория Воробьева on 18/10/2019.
//  Copyright © 2019 Виктория Воробьева. All rights reserved.
//

import UIKit


class MainViewController: UICollectionViewController {

    private let labelName = ["Facts about cats🐱"]

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return labelName.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserActionCell
        
        cell.userLabel.text = labelName[indexPath.row]
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let userAction = labelName[indexPath.item]
        if userAction == labelName.first {
        performSegue(withIdentifier: "InformationTransition", sender: nil)
        }
    }
   
   
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "InformationTransition" {
            let informationalVC = segue.destination as! InformationalViewController
            informationalVC.displayOfInformation()
        }
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 88, height: 86)
    }
}
