//
//  HomeViewController.swift
//  OnlineShopping
//
//  Created by Iskandar Herputra Wahidiyat on 28/05/21.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var itemCategoryTableview: UITableView!
    @IBOutlet weak var monthlyPromoLabel: UILabel!
    @IBOutlet weak var promoItemTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: - Setup
    private func setupView() {
        title = "APLIKASI BELANJA ONLINE"
    }
}
