//
//  PromoTableViewCell.swift
//  OnlineShopping
//
//  Created by Iskandar Herputra Wahidiyat on 29/05/21.
//

import UIKit

final class PromoTableViewCellViewModel {
    private(set) var promoDiscount: String = ""
    private(set) var promoItemImage: UIImage = UIImage()
    private(set) var promoItemTitle: String = ""
    private(set) var promoItemPrice: String = ""
    
    init(promoDiscount: String?,
         promoItemImage: UIImage?,
         promoItemTitle: String?,
         promoItemPrice: String?) {
        if let promoDiscount: String = promoDiscount {
            self.promoDiscount = promoDiscount
        }
        if let promoItemImage: UIImage = promoItemImage {
            self.promoItemImage = promoItemImage
        }
        if let promoItemTitle: String = promoItemTitle {
            self.promoItemTitle = promoItemTitle
        }
        if let promoItemPrice: String = promoItemPrice {
            self.promoItemPrice = promoItemPrice
        }
    }
}

class PromoTableViewCell: UITableViewCell {
    @IBOutlet weak var promoDiscountLabel: UILabel!
    @IBOutlet weak var promoItemImageView: UIImageView!
    @IBOutlet weak var promoItemTitleLabel: UILabel!
    @IBOutlet weak var promoItemPriceLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupContent(content: PromoTableViewCellViewModel) {
        promoDiscountLabel.text = content.promoDiscount
        promoItemTitleLabel.text = content.promoItemTitle
        promoItemPriceLabel.text = content.promoItemPrice
    }
}
