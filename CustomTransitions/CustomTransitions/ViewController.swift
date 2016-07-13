//
//  ViewController.swift
//  CustomTransitions
//
//  Created by zhangjing on 16/7/12.
//  Copyright © 2016年 MrCieong. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    let imageStrings = ["bouquet", "cat", "farm-girl", "grapes", "ladybug", "tulips", "potatoes", "girl"]
    let transition = Animator()
    var selectImageView: UIImageView?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photos"
        navigationController?.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let cell = sender as? ImageCollectionCell, vc = segue.destinationViewController as? ImageViewController {
            vc.image = cell.imageView?.image
            selectImageView = cell.imageView
        }
        
    }

}
// MARK: - UICollectionView data source & delegate
extension ViewController {
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageStrings.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ImageCollectionCell", forIndexPath: indexPath) as! ImageCollectionCell
        cell.imageView.image = UIImage(imageLiteral: imageStrings[indexPath.item])
        return cell
        
    }
}

extension ViewController: UINavigationControllerDelegate {
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.operation = operation
        if operation == .Push {
            transition.originFrame = (selectImageView?.superview?.convertRect(selectImageView!.frame, toView: nil))!
        }
        
        return transition
    }
}


