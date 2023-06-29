//
//  CustomCollectionCell.swift
//  DemoApp
//
//  Created by Kaustubh Deo on 25/06/23.
//

import UIKit

class CustomCollectionCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var customImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func onBind(movie: Movie, completion: @escaping (UIImage) -> ()) {
        nameLabel.text = movie.title

        let url = URL(string: "https://image.tmdb.org/t/p/w342/\(movie.posterPath)")!
                                                              
        URLSession.shared.dataTask(with: URLRequest(url: url)){ [weak self] data,req,error in
                
            guard let apiData = data else { return }
            
            DispatchQueue.main.async {
                self?.customImage.image = UIImage(data: apiData)
                if let image = UIImage(data: apiData) {
                    completion(image)
                }
            }
        }.resume()
    }
}
