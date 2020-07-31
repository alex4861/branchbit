//
//  Select.swift
//  branchbit-ios
//
//  Created by Hugo on 31/07/20.
//  Copyright © 2020 Elektra. All rights reserved.
//

import UIKit

class Select: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    var data: [UIColor] = [.blue,.brown,.green,.magenta,.cyan]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    var selectedIndexPath: IndexPath?

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collection.register(UINib(nibName: "SelectCell", bundle: .main), forCellWithReuseIdentifier: "SelectCell")
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectCell", for: indexPath) as! SelectCell
        item.layer.backgroundColor = data[indexPath.row].cgColor
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)

        cell?.layer.backgroundColor = data[indexPath.row].withAlphaComponent(0.5).cgColor
        self.selectedIndexPath = indexPath
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)

        cell?.layer.backgroundColor = data[indexPath.row].withAlphaComponent(1).cgColor

        self.selectedIndexPath = nil
    }

    @IBOutlet weak var collection: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collection.isScrollEnabled = true
        collection.delegate = self
        collection.dataSource = self
        collection.collectionViewLayout = layout
        collection.allowsSelection = true
    }
    
}
