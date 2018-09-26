//
//  ViewController.swift
//  BlurBackground
//
//  Created by Tandem on 31/05/2018.
//  Copyright © 2018 Tandem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        self.blurEffectView = UIVisualEffectView(effect: self.blurEffect)
        self.blurEffectView.tag = 1
        blurEffectView.alpha = 0
        self.blurEffectView.frame = self.view.frame
        self.view.addSubview(self.blurEffectView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var blurEffect: UIBlurEffect!
    var blurEffectView: UIVisualEffectView!
    
    @IBAction func btnBlurClicked(_ sender: UIButton) {
        
//        UIView.animate(withDuration: 0.3) {
//            self.blurEffectView.alpha = 1
//        }
        
        UIView.transition(with: self.view, duration: 0.3, options: [], animations: {
            self.blurEffectView.alpha = 1
        }) { (ended) in
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
                UIView.animate(withDuration: 0.3) {
                    self.blurEffectView.alpha = 0
//                    if let viewWithTag = self.view.viewWithTag(1) {
//                        viewWithTag.removeFromSuperview()
//                    }
                }
            }
        }
    }
    
}

