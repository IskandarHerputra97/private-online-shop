//
//  ItemDetailViewController.swift
//  OnlineShopping
//
//  Created by Iskandar Herputra Wahidiyat on 28/05/21.
//

import UIKit

class ItemDetailViewController: UIViewController {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemFirstVariantButton: UIButton!
    @IBOutlet weak var itemSecondVariantButton: UIButton!
    @IBOutlet weak var itemThirdVariantButton: UIButton!
    @IBOutlet weak var itemDescriptionTitleLabel: UILabel!
    @IBOutlet weak var itemDescriptionTextView: UITextView!
    @IBOutlet weak var checkoutButton: UIButton!
    @IBOutlet weak var addToCartButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    //MARK: - Setup
    private func setupView() {
        title = "Halaman Detail Barang"
    }
}
