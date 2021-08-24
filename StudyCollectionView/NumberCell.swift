//
//  NumberCell.swift
//  StudyCollectionView
//
//  Created by Vladimir Oleinikov on 24.08.2021.
//

import UIKit

class NumberCell: UICollectionViewCell {
    
    @IBOutlet var numberLabel: UILabel!
    
    static let reuseIdentifier = String(describing: NumberCell.self)
    
}
