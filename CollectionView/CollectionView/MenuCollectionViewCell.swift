//
//  MenuCollectionViewCell.swift
//  CollectionView
//
//  Created by Raja Adeel Ahmed on 7/2/20.
//  Copyright © 2020 Raja Adeel Ahmed. All rights reserved.
//

import UIKit

protocol MenuCollectionProtocol {
    func deleteClickedProtocol(index:Int)
    func shareClickedProtocol(index:Int)

}

class MenuCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var btnDelete: UIButton!
    var delegate: MenuCollectionProtocol!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func btnDeleteClicked(_ sender: Any) {
        delegate.deleteClickedProtocol(index: btnDelete.tag)
    }
    
    @IBAction func btnShareClicked(_ sender: Any) {
        delegate.shareClickedProtocol(index: btnDelete.tag)
    }
}
