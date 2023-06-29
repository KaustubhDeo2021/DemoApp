//
//  DetailListingScreenViewController.swift
//  DemoApp
//
//  Created by Kaustubh Deo on 29/06/23.
//

import UIKit

class DetailListingScreen: UIViewController {
    
    @IBOutlet weak var movieDetails: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var movieImage: UIImage?
    var movieDetailsString: String?
   
    init(movieImage: UIImage?, movieDetailsString: String?) {
    
        self.movieImage = movieImage
        self.movieDetailsString = movieDetailsString
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.movieDetails.text = movieDetailsString
        self.imageView.image = movieImage
    }

}
