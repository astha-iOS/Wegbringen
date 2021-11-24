//
//  RestaurantsViewController.swift
//  Wegbringen
//
//  Created by Astha yadav on 18/11/21.
//

import UIKit
import os

class RestaurantViewController: UIViewController,ObservableObject {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var sortByLabel: UILabel!
    @IBOutlet weak var sortByButton: UIButton!
    private var pickerView : UIPickerView!
    
    private var isFilter = false
    private var didTapSearchDelete = false

    private var restaurantViewModel: RestaurantViewModel!
    private var restaurants: [Restaurant] = []
    private var filteredRestaurant = [Restaurant]()
    private var currentSortType = String()
    private let sortByArray = SortList.allValues
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        restaurantViewModel = RestaurantViewModel(delegate: self)
        if let sortType = (UserDefaults.standard.value(forKey: "selectedSortType") as? [String: Any]){
            currentSortType = sortType["currentSortType"] as? String ?? SortList.bestMatch.description
            self.sortByLabel.text = sortType["sortTitle"] as? String ?? "Best Match"
        }else{
            currentSortType = SortList.bestMatch.description
            self.sortByLabel.text = "Best Match"
        }
        
        getRestorents(searchText: "")
    }
    
    func getRestorents(searchText:String){
 
        restaurantViewModel.getRestuarentList(filterBy: searchText, sortBy: currentSortType)
        let dict = ["currentSortType":currentSortType,"sortTitle":self.sortByLabel.text]
        UserDefaults.standard.setValue(dict, forKey: "selectedSortType")
        UserDefaults.standard.synchronize()
    }
    
    private func setupUI(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.searchBar.delegate = self
        self.tableView.estimatedRowHeight = 250;
        self.tableView.rowHeight = UITableView.automaticDimension
        pickerViewUI()
        self.pickerView.isHidden = true
        sortByButton.setTitle("", for: .normal)
    }
    
    private func pickerViewUI(){
        self.pickerView = UIPickerView(frame:CGRect(x: 0, y: 150, width: self.view.frame.size.width, height: 300))
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        self.pickerView.backgroundColor = UIColor.white
        self.view.addSubview(self.pickerView)
    }
    
    @IBAction func sortByClick(_ sender: Any) {
        if self.pickerView.isHidden{
            self.pickerView.isHidden = false
        }else{
            self.pickerView.isHidden = true
        }
    }

}

//MARK: - RestaurantViewModelProtocol
extension RestaurantViewController: RestaurantViewModelProtocol{
    func didSuccess(restaurants: [Restaurant]) {
        self.restaurants = restaurants
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didFailure(error: String) {
        os_log("%@",log: Log.fileSyatem, type: .error, error)
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension RestaurantViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.restaurants.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.restuarantTableViewCell) as! RestaurantTableViewCell
        cell.configureTableCellView(restaurantInfo:self.restaurants[indexPath.row])                               
        return cell
    }
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

//MARK: - UISearchBarDelegate
extension RestaurantViewController: UISearchBarDelegate{

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false {
            getRestorents(searchText: searchText)
        }else{
            getRestorents(searchText: "")
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
        getRestorents(searchText: "")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
        if let searchText = searchBar.text,searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false {
            getRestorents(searchText: searchText)
        }
    }
    
}


extension RestaurantViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sortByArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sortByArray[row].rawValue
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.sortByLabel.text = sortByArray[row].rawValue
        self.pickerView.isHidden = true
        currentSortType = sortByArray[row].description
        getRestorents(searchText: "")
    }

}
