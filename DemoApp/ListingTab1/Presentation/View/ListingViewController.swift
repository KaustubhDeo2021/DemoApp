//
//  ListingViewController.swift
//  DemoApp
//
//  Created by Kaustubh Deo on 25/06/23.
//

import UIKit

class ListingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataList = [Movie]()
    var selectedIndexPath: IndexPath?
    var listingViewModel = ListingViewModel(fetchMovieListingUsecase: FetchMovieListingUsecase(networkManager: NetworkManager.shared))
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        listingViewModel.fetchMovieListing(completion: {[weak self] result in
            DispatchQueue.main.async {
                
                if let result = result?.results {
                    self?.dataList = result
                }
                
                self?.tableView.reloadData()
            }
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         
        if let destination  = segue.destination as? DetailListingScreen, let index = selectedIndexPath {
             
            destination.movieImage = dataList[index.row].imageData
            destination.movieDetailsString = dataList[index.row].overview
        }
    }
}

extension ListingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.customTableViewCell) as! CustomTableViewCell
        
        
        if dataList[indexPath.row].imageData == nil {
            cell.onBind(movie: dataList[indexPath.row], completion: {[weak self] image in
                self?.dataList[indexPath.row].imageData = image
            })
        } else {
            cell.nameLabel.text = self.dataList[indexPath.row].title
            cell.infoLabel.text = self.dataList[indexPath.row].overview
            cell.customImage.image = self.dataList[indexPath.row].imageData
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
        self.performSegue(withIdentifier: "DetailListingScreen", sender: nil)
    }
}

