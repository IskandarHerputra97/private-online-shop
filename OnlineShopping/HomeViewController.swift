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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchItemCategories()
    }
    
    //MARK: - Setup
    private func setupView() {
        title = "APLIKASI BELANJA ONLINE"
        itemCategoryTableview.register(UINib(nibName: "ItemCategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemCategoryTableViewCell")
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
            
        }
        return UITableViewCell()
    }
}

extension HomeViewController: UITableViewDelegate {
    
}
