//
//  ViewController.swift
//  PracaDomowa03
//
//  Created by Aleksandra Konopka on 28/03/2019.
//  Copyright © 2019 Aleksandra Konopka. All rights reserved.
//

import UIKit

// Z powodu braku pomysłów oraz czasu nie poradziłam sobie z relizacją zadania w dostatecznym stopniu. Żeby jednak udowodnić moje zaangażowanie, zostawiam w komentrzu na dole pliku fragmenty moich prób prawidłowego wykonania pracy domowej :)

class ViewController: UIViewController {
    let layout = MyLayout()
    
    @IBOutlet var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.dataSource = self
        collection.delegate = self
        collection.setCollectionViewLayout(layout, animated: true)
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
        return cell
    }
}

extension ViewController : UICollectionViewDelegate
{

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        for  cell in collection.visibleCells
        {
            cell.backgroundColor = UIColor.red
        }
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        for  cell in collection.visibleCells
        {
            if( cell.backgroundColor == UIColor.red)
            {
                cell.backgroundColor = UIColor.orange
            }
            else
            {
                cell.backgroundColor = UIColor.yellow
            }
        }
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let contentTarget = targetContentOffset.pointee.x
        if contentTarget > collection.frame.width
        {
            let offset = Int(contentTarget) % 300
            collection.contentOffset.x -= CGFloat(offset)
        }
        if velocity.x < 0
        {
         whichOne = 2
        }
        else
        {
        whichOne = 1
        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        whichOne = 1
    }
}

//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        layout.invalidateLayout()
//        for (index,a) in collection.visibleCells.enumerated()
//        {
//
//            print("A number \(index)")
//            print(collection.convert(a.frame, to: view).maxX/375/2 - floor(collection.convert(a.frame, to: view).maxX/375/2))
//
//            if collection.convert(a.frame, to: view).maxX/375/2 - floor(collection.convert(a.frame, to: view).maxX/375/2) >= 0.25 && collection.convert(a.frame, to: view).maxX/375/2 - floor(collection.convert(a.frame, to: view).maxX/375/2) <  0.5
//            {
//                // jeśli w środku to poruszajac robie pomaranczowa
//                a.backgroundColor = UIColor.orange
//                //a.frame(forAlignmentRect:CGRect(x: a.frame.minX, y: a.frame.minY, width: 300, height: 300))
//                //a.frame = CGRect(x: a.frame.minX-50, y: a.frame.minY-50, width: 250, height: 250)
//                //CGRect(x: a.frame.minX, y: a.frame.minY, width: 300, height: 300)
//
//
//            }
//            else {
//                a.backgroundColor = UIColor.yellow
//                //a.frame(forAlignmentRect:CGRect(x: a.frame.minX, y: a.frame.minY, width: 200, height: 200))
//                //a.frame = CGRect(x: a.frame.minX, y: a.frame.minY, width: 200, height: 200)
//            }
//        }
//
//    }
//    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
////        print("juz")
////        for a in collection.visibleCells
////        {
////           // jeśli w środku to zatrzymujac robie czerwona
////            a.backgroundColor = UIColor.red
////            // jak na zewnatrz to zatrzymujac robie zielona
////            a.backgroundColor = UIColor.green
////        }
//    }
//scroll
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
////        if collection.visibleCells.count == 4
////        {
////            collection.visibleCells[1].
////        }
//    }
        //collection.scrollToItem(at: IndexPath(row: 6, section: 0), at: .centeredHorizontally, animated: true)
//        print(velocity.x)
////        if velocity.x < 1
////        {
////            collection.scrollToItem(at: IndexPath(row: 2, section: 0), at: .centeredHorizontally, animated: true)
////        }
//        if velocity.x < 1 && velocity.x > -1
//        {
//        var number = ""
//        for (index,cell) in collection.visibleCells.enumerated()
//        {
//            number = (cell as! MyCell).label!.text ?? ""
//            if collection.visibleCells.count == 3 && index == 1
//                        {
//                        collection.scrollToItem(at: IndexPath(row: Int(number)!, section: 0), at: .centeredHorizontally, animated: true)
//
//                            //print("1")
//                        }
//                        else if(collection.visibleCells.count == 3 && index == 2)
//                        {
//                              collection.scrollToItem(at: IndexPath(row: Int(number)!, section: 0), at: .centeredHorizontally, animated: true)
//
//                             //print("2")
//                        }
//                        else if(collection.visibleCells.count == 2 && index == 0)
//                        {
//                               collection.scrollToItem(at: IndexPath(row: Int(number)!, section: 0), at: .centeredHorizontally, animated: true)
//
//                            // print("3")
//                        }
//                        else
//                        {
////                            collection.cellForItem(at: IndexPath(row: Int(number)!, section: 0))?.backgroundColor = UIColor.yellow
//
//                           // print("4 number: \(number)")
//                        }
//            }
//        }
        
//        var number = ""
//        for (index,item) in collection.visibleCells.enumerated()
//        {
//            number = (item as! MyCell).label!.text ?? ""
//            if collection.visibleCells.count == 3 && index == 1
//            {
//            collection.scrollToItem(at: IndexPath(row: Int(number)!, section: 0), at: .centeredHorizontally, animated: true)
//            collection.cellForItem(at: IndexPath(row: Int(number)!, section: 0))?.backgroundColor = UIColor.green
//                print("1")
//            }
//            else if(collection.visibleCells.count == 3 && index == 2)
//            {
//                  collection.scrollToItem(at: IndexPath(row: Int(number)!, section: 0), at: .centeredHorizontally, animated: true)
//                collection.cellForItem(at: IndexPath(row: Int(number)!, section: 0))?.backgroundColor = UIColor.green
//
//                 print("2")
//            }
//            else if(collection.visibleCells.count == 2 && index == 0)
//            {
//                   collection.scrollToItem(at: IndexPath(row: Int(number)!, section: 0), at: .centeredHorizontally, animated: true)
//                collection.cellForItem(at: IndexPath(row: Int(number)!, section: 0))?.backgroundColor = UIColor.green
//
//                 print("3")
//            }
//            else
//            {
//                collection.cellForItem(at: IndexPath(row: Int(number)!, section: 0))?.backgroundColor = UIColor.yellow
//                //collection.visibleCells[index].backgroundColor =
//                print("4 number: \(number)")
//            }
//        }
//        if collection.visibleCells.count == 3
//        {
//             var a = (collection.visibleCells[1] as! MyCell).label?.text
//
//      collection.scrollToItem(at: IndexPath(row: Int(a!)! , section: 0), at: .centeredHorizontally, animated: true)
//        collection.visibleCells[1].backgroundColor = UIColor.green
//        }
//        else
//        {
//            for a in collection.visibleCells
//            {
//                a.backgroundColor = UIColor.red
//
//            }
//        }
//        if collection.visibleCells.count == 4
//        {
//            var a = (collection.visibleCells[2] as! MyCell).label?.text
//            collection.scrollToItem(at: IndexPath(row: Int(a!)! , section: 0), at: .centeredHorizontally, animated: true)
//            collection.visibleCells[2].backgroundColor = UIColor.green
//            print("to: \((collection.visibleCells[2] as! MyCell).label.text))")
//        }
//        else
//        {
//
//            for a in collection.visibleCells
//            {
//                a.backgroundColor = UIColor.red
//            }
//        }
//        print(collection.visibleCells.count)
        //scrollView.contentOffset.x = 110//        for a in collection.visibleCells
//        {
//            // jeśli w środku to zatrzymujac robie czerwona
//            a.backgroundColor = UIColor.red
//            // jak na zewnatrz to zatrzymujac robie zielona
//            a.backgroundColor = UIColor.green
//        }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collection.cellForItem(at: indexPath)?.backgroundColor = UIColor.green
//    }


//extension ViewController: UICollectionViewDelegateFlowLayout
//{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let collectionWidth = collection.bounds.width
//        return CGSize(width: collectionWidth/2, height: collectionWidth/2)
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//}
