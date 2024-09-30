//
//  CollectionView.swift
//  Salmon
//
//  Created by Нюргун on 06.09.2024.
//

import UIKit

final class CollectionView: UICollectionView {
    
    private let collectionView: CollectionView()
    let layout = UICollectionViewFlowLayout()
    let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collection.backgroundColor = .systemGray
    collection.translatesAutoresizingMaskIntoConstraints = false
    return collection
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
