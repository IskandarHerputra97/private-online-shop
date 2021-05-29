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
    
    private var itemCategoryCellViewModel: [ItemCategoryTableViewCellViewModel] = []
    private var itemCategoryDataSource: [ItemCategory] = [
        ItemCategory(name: "Lihat Semua"),
        ItemCategory(name: "Serum"),
        ItemCategory(name: "Obat"),
        ItemCategory(name: "Baby Care"),
        ItemCategory(name: "Beauty Care"),
    ]
    
    private var promoCellViewModel: [PromoTableViewCellViewModel] = []
    private var promoDataSource: [Promo] = [
        Promo(promoDiscount: "10%", promoItemTitle: "Promo Item", promoItemPrice: "Rp 50.000"),
        Promo(promoDiscount: "10%", promoItemTitle: "Promo Item", promoItemPrice: "Rp 50.000"),
        Promo(promoDiscount: "10%", promoItemTitle: "Promo Item", promoItemPrice: "Rp 50.000"),
        Promo(promoDiscount: "10%", promoItemTitle: "Promo Item", promoItemPrice: "Rp 50.000"),
        Promo(promoDiscount: "10%", promoItemTitle: "Promo Item", promoItemPrice: "Rp 50.000")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchItemCategories()
        fetchPromoItem()
    }
    
    //MARK: - Setup
    private func setupView() {
        title = "APLIKASI BELANJA ONLINE"
        itemCategoryTableview.register(UINib(nibName: "ItemCategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemCategoryTableViewCell")
        promoItemTableView.register(UINib(nibName: "PromoTableViewCell", bundle: nil), forCellReuseIdentifier: "PromoTableViewCell")
    }
    
    //MARK: - Private
    private func fetchItemCategories() {
        var itemCategoryCellViewModel: [ItemCategoryTableViewCellViewModel] = []
        
        for item in itemCategoryDataSource {
            let viewModel: ItemCategoryTableViewCellViewModel = ItemCategoryTableViewCellViewModel(itemCategoryImage: UIImage(systemName: "dollarsign.circle"),
                                                                                                   itemCategoryTitle: item.name)
            itemCategoryCellViewModel.append(viewModel)
        }
        self.itemCategoryCellViewModel.append(contentsOf: itemCategoryCellViewModel)
        
        if self.itemCategoryCellViewModel.count > 0 {
            self.itemCategoryTableview.reloadData()
        }
    }
    
    private func fetchPromoItem() {
        var promoCellViewModel: [PromoTableViewCellViewModel] = []
        
        for item in promoDataSource {
            let viewModel: PromoTableViewCellViewModel = PromoTableViewCellViewModel(promoDiscount: item.promoDiscount,
                                                                                     promoItemImage: UIImage(systemName: "dollarsign.circle"),
                                                                                     promoItemTitle: item.promoItemTitle,
                                                                                     promoItemPrice: item.promoItemPrice)
            promoCellViewModel.append(viewModel)
        }
        self.promoCellViewModel.append(contentsOf: promoCellViewModel)
        
        if self.promoCellViewModel.count > 0 {
            self.promoItemTableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 0 {
            return itemCategoryCellViewModel.count
        }
        else if tableView.tag == 1 {
            return 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 0 {
            guard indexPath.row < itemCategoryCellViewModel.count, let cell: ItemCategoryTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ItemCategoryTableViewCell") as? ItemCategoryTableViewCell else {
                return UITableViewCell()
            }
            let viewModel: ItemCategoryTableViewCellViewModel = itemCategoryCellViewModel[indexPath.row]
            cell.setupContent(content: viewModel)
            return cell
        }
        else if tableView.tag == 1 {
            guard indexPath.row < itemCategoryCellViewModel.count, let cell: PromoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PromoTableViewCell") as? PromoTableViewCell else {
                return UITableViewCell()
            }
            let viewModel: PromoTableViewCellViewModel = promoCellViewModel[indexPath.row]
            cell.setupContent(content: viewModel)
            return cell
        }
        return UITableViewCell()
    }
}

extension HomeViewController: UITableViewDelegate {
    
}
