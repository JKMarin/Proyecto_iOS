//
//  CollectionViewCell.swift
//  petfriendlyAround
//
//  Created by user139236 on 6/3/18.
//  Copyright © 2018 JC_Ronald. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoriaImage: UIImageView!
    @IBOutlet weak var categoriaLabel: UILabel!
    
    
    func displayContent(image: UIImage, title: String) {
        categoriaImage.image = image
        categoriaLabel.text = title
    }
    
}
