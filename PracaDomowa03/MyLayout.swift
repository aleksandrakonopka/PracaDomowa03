//
//  MyLayout.swift
//  PracaDomowa03
//
//  Created by Aleksandra Konopka on 28/03/2019.
//  Copyright © 2019 Aleksandra Konopka. All rights reserved.
//
var whichOne = 0
import UIKit
class MyLayout : UICollectionViewFlowLayout
{
    
    override func prepare() {
        
        scrollDirection = .horizontal
        itemSize = CGSize(width: 240, height: 240)
        minimumLineSpacing = 60
        
        let moveBy = ((collectionView?.frame.width)!-240)/2
            self.sectionInset = UIEdgeInsets(top: 200, left: moveBy, bottom: 200, right: moveBy)
        }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var myRect = CGRect()
        myRect.origin = self.collectionView!.contentOffset
        myRect.size = self.collectionView!.bounds.size
        guard let attr = super.layoutAttributesForElements(in: myRect)
        else
        {
            return nil
        }
        
        let copiedAttr = attr.map(){$0.copy() as! UICollectionViewLayoutAttributes
        }
        if copiedAttr.count > 2
        {
        copiedAttr[whichOne].transform =  CGAffineTransform(scaleX: 1.3, y: 1.2)
        }
        else if copiedAttr.count == 1
        {
          copiedAttr[1].transform =  CGAffineTransform(scaleX: 1.3, y: 1.2)
        }
        else
        {
          copiedAttr[0].transform =  CGAffineTransform(scaleX: 1.3, y: 1.2)
        }
        
        return copiedAttr
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
