//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 柵木栄一 on 2019/06/22.
//  Copyright © 2019 msk5ej. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    //画面タップした時のアクション
    @IBAction func tapimage(_ sender: Any) {
        performSegue(withIdentifier:"zoom", sender: nil)
        if self.timer != nil {
        self.timer.invalidate()
        self.timer = nil
        }
    }
    
    //画像を指定する変数
    var imageNo = 0
    //画像表示のfunction
    func displayImage() {
        let imageArray = [
            "image1.JPG",
            "image2.JPG",
            "image3.JPG",
            "image4.JPG",
            "image5.JPG",
        ]
        let name = imageArray[imageNo]
        let image = UIImage(named: name)
        imageView.image = image
    }
    
    //進むボタンの機能
    @IBAction func go(_ sender: Any) {
        if self.timer == nil {
        if imageNo == 4 {
            imageNo = 0
        }
        else {
            imageNo += 1
        }
        displayImage()
        }
    }
    
    //戻るボタンの機能
    @IBAction func back(_ sender: Any) {
        if self.timer == nil {
        if imageNo == 0 {
            imageNo = 4
        }
        else {
            imageNo -= 1
        }
        displayImage()
        }
    }
    
    //タイマー格納の変数
    var timer: Timer!
    
    //２秒ごとに呼び出される関数
    @objc func updateTimer(_ timer: Timer) {
        if imageNo == 4 {
            imageNo = 0
        }
        else {
            imageNo += 1
        }
        displayImage()
    }
    
    //再生／停止ボタンの機能
    @IBAction func startstop(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        }
        else {
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
    //初期表示
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let image = UIImage(named: "image1.JPG")
        imageView.image = image
    }

    //画面遷移時の画像指定データの受け渡し
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let zoomViewController:ZoomViewController = segue.destination as! ZoomViewController
    zoomViewController.displayNo = imageNo
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}

