//
//  ItemCategoryTableViewCell.swift
//  OnlineShopping
//
//  Created by Iskandar Herputra Wahidiyat on 29/05/21.
//

import UIKit

final class ItemCategoryTableViewCellViewModel {
    private(set) var itemCategoryImage: UIImage = UIImage()
    private(set) var itemCategoryTitle: String = ""
    
    init(itemCategoryImage: UIImage?,
         itemCategoryTitle: String?) {
        if let itemCategoryImage: UIImage = itemCategoryImage {
            self.itemCategoryImage = itemCategoryImage
        }
        if let itemCategoryTitle: String = itemCategoryTitle {
            self.itemCategoryTitle = itemCategoryTitle
        }
    }
}

class ItemCategoryTableViewCell: UITableViewCell {
    @IBOutlet weak var itemCategoryImageView: UIImageView!
    @IBOutlet weak var itemCategoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupContent(content: ItemCategoryTableViewCellViewModel) {
        itemCategoryImageView.image = content.itemCategoryImage
        itemCategoryLabel.text = content.itemCategoryTitle
    }
}
