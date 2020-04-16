//
//  VillainCollectionViewController.swift
//  BondVillains
//
//  Created by Marlhex on 2020-04-15.
//  Copyright © 2020 Udacity. All rights reserved.
//

import UIKit

class VillainCollectionViewController: UICollectionViewController {

	// MARK: Properties

	// Get ahold of some villains, for the table
	// This is an array of Villain instances.
	let allVillains = Villain.allVillains

	// MARK: Life Cycle

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.tabBarController?.tabBar.isHidden = false
	}

	// MARK: Collection View Data Source

	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.allVillains.count
	}

	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VillainCollectionViewCell", for: indexPath) as! VillainCollectionViewCell
		let villain = self.allVillains[(indexPath as NSIndexPath).row]

		// Set the name and image
		cell.lbl.text = villain.name
		cell.img?.image = UIImage(named: villain.imageName)
		//cell.schemeLabel.text = "Scheme: \(villain.evilScheme)"

		return cell
	}

	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {

		let detailController = self.storyboard!.instantiateViewController(withIdentifier: "VillainDetailViewController") as! VillainDetailViewController
		detailController.villain = self.allVillains[(indexPath as NSIndexPath).row]
		self.navigationController!.pushViewController(detailController, animated: true)

	}
}
