//
//  NewUserViewController.swift
//  testing
//
//  Created by Steve JobsOne on 1/29/19.
//  Copyright © 2019 mobioapp. All rights reserved.
//

import UIKit

class NewUserViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
        let TAGS = ["Tech", "Design", "Humor", "Travel", "Music", "Writing", "Social Media", "Life", "Education", "Edtech fgdfghf fghfgh", "Education Reform", "Photography", "Startup", "Poetry", "Women In Tech terminal hjj ghfgh ghfgh ", "Female Founders", "Business", "Fiction", "Love", "Food", "Sports"]
        
        @IBOutlet weak var collectionView: UICollectionView!
        @IBOutlet weak var flowLayout: FlowLayout!
        var sizingCell: TagCell?
        
        var tags = [Tag]()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            let cellNib = UINib(nibName: "TagCell", bundle: nil)
            self.collectionView.register(cellNib, forCellWithReuseIdentifier: "TagCell")
            self.collectionView.backgroundColor = UIColor.clear
            self.sizingCell = (cellNib.instantiate(withOwner: nil, options: nil) as NSArray).firstObject as! TagCell?
            //self.flowLayout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            for name in TAGS {
                let tag = Tag()
                tag.name = name
                self.tags.append(tag)
            }
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return tags.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as! TagCell
            self.configureCell(cell, forIndexPath: indexPath)
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            //self.configureCell(self.sizingCell!, forIndexPath: indexPath)
            //return self.sizingCell!.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
            let tag = tags[indexPath.row]
            self.sizingCell!.tagName.text = tag.name
            self.sizingCell!.sizeToFit()
            return CGSize(width: self.sizingCell!.tagName.frame.width, height: 32)
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            collectionView.deselectItem(at: indexPath, animated: false)
            tags[indexPath.row].selected = !tags[indexPath.row].selected
            self.collectionView.reloadData()
        }
        
        func configureCell(_ cell: TagCell, forIndexPath indexPath: IndexPath) {
            let tag = tags[indexPath.row]
            cell.tagName.text = tag.name
            cell.tagName.textColor = tag.selected ? UIColor.white : UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
            cell.backgroundColor = tag.selected ? UIColor(red: 0, green: 1, blue: 0, alpha: 1) : UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
    }


}
