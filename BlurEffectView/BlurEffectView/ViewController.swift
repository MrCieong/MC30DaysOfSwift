//
//  ViewController.swift
//  BlurEffectView
//
//  Created by zhangjing on 16/8/5.
//  Copyright © 2016年 MrCieong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let veView = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
        veView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 480)
        let scrollView = UIScrollView(frame: view.bounds)
        view.addSubview(scrollView)
        scrollView.addSubview(veView)
        scrollView.contentSize = CGSize(width: view.bounds.width, height: veView.bounds.height + view.bounds.height)
        
        scrollView.contentOffset = CGPoint(x: 0, y: veView.bounds.height)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

