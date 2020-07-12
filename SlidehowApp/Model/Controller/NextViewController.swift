//
//  NextViewController.swift
//  SlidehowApp
//
//  Created by Keita Munekawa on 2020/06/28.
//  Copyright © 2020 KM. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    var selectedImage = UIImage()

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = selectedImage
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    

}
