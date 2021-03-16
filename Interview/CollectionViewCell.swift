//
//  CollectionViewCell.swift
//  Interview
//
//  Created by lawliet on 2021/3/11.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        button.layer.cornerRadius = button.bounds.height/2
        button.setTitleColor(.white, for: .selected)
    }
    
    public func updateWithModel(model: Color) {
        button.setTitleColor(model.titleColor, for: .normal)
        button.backgroundColor = model.backgroundColor
    }
}
