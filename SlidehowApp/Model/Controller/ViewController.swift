//
//  ViewController.swift
//  SlidehowApp
//
//  Created by Keita Munekawa on 2020/06/28.
//  Copyright © 2020 KM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var imageArray = [UIImage]()
    var count = Int()
    var timer:Timer!

    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var moveBotton: UIButton!
    @IBOutlet var move2Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        count = 0
        for i in 0..<5{
            //画像を一つずつ取り出す
            let image = UIImage(named: "\(i)")
            //配列として追加
            imageArray.append(image!)
        }
            //最初に表示したい画像
        imageView.image = UIImage(named: "0")
        }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
    
    @objc func timerUpdate(){
        count += 1
        if count > 4{
            count = 0
        }
        imageView.image = imageArray[count]
    }
    
    @IBAction func forwardButton(_ sender: Any) {
        count += 1
        if count > 4 {
            count = 0
        }
        imageView.image = imageArray[count]
        
    }
    
    @IBAction func animationButton(_ sender: Any) {
        if self.timer == nil {
            startTimer()
            moveBotton.isEnabled = false
            move2Button.isEnabled = false
        }else{
            self.timer.invalidate()
            moveBotton.isEnabled = true
            move2Button.isEnabled = true
            self.timer = nil
        }
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        count -= 1
        if count < 0 {
            count = 4
        }
        imageView.image = imageArray[count]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "next"){
            let nextViewController:NextViewController = (segue.destination as! NextViewController)
            nextViewController.selectedImage = imageView.image!
            
        }
    }
    
    @IBAction func unwindToTop(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
    
   
    @IBAction func tapImage(_ sender: Any) {
        performSegue(withIdentifier: "next", sender: nil)
    }
    
}

