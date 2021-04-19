//
//  MainViewController.swift
//  randomPicAPI
//
//  Created by Betty Pan on 2021/4/19.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
        doubleTapGesture()
        
    }
    
    @objc func fetchImage() {
        //欲讀取資料url
        let urlStr = "https://picsum.photos/200/300"
        
        if let url = URL(string: urlStr) {
            //於其他執行緒open file, read content
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    //主執行緒執行 display content
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: data)
                    }
                }
            }.resume() //執行task
        }
        
    }
    
    func doubleTapGesture() {
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(fetchImage))
        doubleTap.numberOfTapsRequired = 2
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(doubleTap)
    }
    
}
