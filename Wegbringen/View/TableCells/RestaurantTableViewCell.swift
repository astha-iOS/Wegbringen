//
//  RestaurantTableViewCell.swift
//  Wegbringen
//
//  Created by Astha yadav on 18/11/21.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var popularLabel: UILabel!
    @IBOutlet weak var bestmatchLabel: UILabel!
    @IBOutlet weak var newestLabel: UILabel!
    @IBOutlet weak var avgProductPriceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var minCostLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var deliveryCostLabel: UILabel!
    
    var restaurantTableCellVM: RestaurantTableCellViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureTableCellView(restaurantInfo: Restaurant){
        self.restaurantTableCellVM = RestaurantTableCellViewModel(restaurant: restaurantInfo)
        self.nameLabel.text = self.restaurantTableCellVM.restaurantName
        self.statusLabel.text = self.restaurantTableCellVM.status
        self.popularLabel.text = self.restaurantTableCellVM.popularity
        self.bestmatchLabel.text = self.restaurantTableCellVM.bestMatch
        self.newestLabel.text = self.restaurantTableCellVM.newest
        self.avgProductPriceLabel.text = self.restaurantTableCellVM.averageProductPrice
        self.ratingLabel.text = self.restaurantTableCellVM.ratingAverage
        self.minCostLabel.text = self.restaurantTableCellVM.minCost
        self.distanceLabel.text = self.restaurantTableCellVM.distance
        self.deliveryCostLabel.text = self.restaurantTableCellVM.deliveryCosts
    }
}
