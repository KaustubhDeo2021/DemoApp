//
//  CollectionViewController.swift
//  DemoApp
//
//  Created by Kaustubh Deo on 25/06/23.
//

import UIKit

class CollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var selectedIndexPath: IndexPath?
    var dataList = [Movie]()
    var collectionViewModel = CollectionViewModel(fetchMovieListingUsecase: FetchMovieListingUsecase(networkManager: NetworkManager.shared))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewModel.fetchMovieListing(completion: {[weak self] result in
            DispatchQueue.main.async {
                
                if let result = result?.results {
                    self?.dataList = result
                }
                
                self?.collectionView.reloadData()
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

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return self.dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            return CGSize(width: collectionView.frame.width/2 - 10, height: 220)
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.customCollectionCell, for: indexPath) as! CustomCollectionCell
        
        if dataList[indexPath.row].imageData == nil {
            cell.onBind(movie: dataList[indexPath.row], completion: {[weak self] image in
                self?.dataList[indexPath.row].imageData = image
            })
        } else {
            cell.nameLabel.text = self.dataList[indexPath.row].title
            cell.customImage.image = self.dataList[indexPath.row].imageData
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
        self.performSegue(withIdentifier: "DetailListingScreen", sender: nil)
    }
}

