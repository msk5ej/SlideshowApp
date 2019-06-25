//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by 柵木栄一 on 2019/06/25.
//  Copyright © 2019 msk5ej. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {

    @IBOutlet weak var zoomimageView: UIImageView!
    var displayNo:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageArray = [
            "image1.JPG",
            "image2.JPG",
            "image3.JPG",
            "image4.JPG",
            "image5.JPG",
            ]
        let name = imageArray[displayNo]
        let image = UIImage(named: name)
        zoomimageView.image = image
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
