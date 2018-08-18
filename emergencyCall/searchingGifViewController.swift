//
//  searchingGifViewController.swift
//  emergencyCall
//
//  Created by Techsviewer on 6/26/18.
//  Copyright © 2018 Techsviewer. All rights reserved.
//

import UIKit

class searchingGifViewController: UIViewController {

    var time = 15
    var timer = Timer()
    
    
//@IBOutlet weak var gifURL: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//
//        let gifURL : String = "http://www.gifbin.com/bin/4802swswsw04.gif"
//        let imageURL = UIImage.gifImageWithURL(gifURL)
//        let imageView3 = UIImageView(image: imageURL)
//        imageView3.frame = CGRect(x: 61, y: 1, width: 110, height: 110)

        // Do any additional setup after loading the view.
        //performSegue(withIdentifier: "segue", sender:self)
        
        
                Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updatetime), userInfo: nil, repeats: true)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func updatetime()
    {
        time -= 1
        if(time == 0)
        {
            //prepare(for: UIStoryboardSegue, sender: self)
            performSegue(withIdentifier: "segue", sender: self)
        }
    }

    



}
