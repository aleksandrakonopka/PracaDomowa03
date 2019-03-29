//
//  MyLayout.swift
//  PracaDomowa03
//
//  Created by Aleksandra Konopka on 28/03/2019.
//  Copyright © 2019 Aleksandra Konopka. All rights reserved.
//

import UIKit
class MyLayout : UICollectionViewFlowLayout
{
    
    override func prepare() {
        
        scrollDirection = .horizontal
        itemSize = CGSize(width: 220, height: 220)
        minimumLineSpacing = 70
        
        let moveBy = ((collectionView?.frame.width)!-220)/2
            self.sectionInset = UIEdgeInsets(top: 200, left: moveBy, bottom: 200, right: moveBy)
        }
//    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        var visibleRect = CGRect()
//        visibleRect.origin = self.collectionView!.contentOffset
//        visibleRect.size = self.collectionView!.bounds.size
//        guard let attr = super.layoutAttributesForElements(in: visibleRect)
//            else
//        {
//            return nil
//        }
//
//       // attr
//       // attr.first?.center = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
//        return attr
//    }
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
