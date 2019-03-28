//
//  ViewController.swift
//  PracaDomowa03
//
//  Created by Aleksandra Konopka on 28/03/2019.
//  Copyright © 2019 Aleksandra Konopka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.dataSource = self
        collection.delegate = self
        //collection.isPagingEnabled = true
    }


}
extension ViewController : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
        cell.label.text = String(indexPath.row)
//        cell.center.x = cell.center.x + collection.center.x - 100
        return cell
    }
}
extension ViewController : UICollectionViewDelegate
{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        for a in 0...99
//        {
//            collection.cellForItem(at: IndexPath(item: a, section: 1))?.backgroundColor = UIColor.green
//        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collection.cellForItem(at: indexPath)?.backgroundColor = UIColor.green
    }
}
